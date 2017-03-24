class Servicio < ApplicationRecord
  belongs_to :ubicacion
  belongs_to :tipo_servicio
  belongs_to :especialista

  has_many :horarios, dependent: :destroy
  has_many :usuarios, dependent: :destroy
  has_many :turnos, through: :horarios, dependent: :destroy
  has_many :dia, through: :turnos, dependent: :destroy
  has_many :citas, through: :turnos, dependent: :destroy
  has_many :evaluaciones, through: :citas, dependent: :destroy
  has_many :calificaciones, through: :evaluaciones, dependent: :destroy
  has_many :criterios, through: :calificaciones, dependent: :destroy


  has_attached_file :foto, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/

  extend FriendlyId
  friendly_id :descripcion, use: :slugged


    after_save :save_horario_turnos

  def self.titulo
	  return "Servicio"
  end

  def contarCalificaciones
    return self.criterios.count
  end


  def foto_url
        url+foto.url(:medium)
    end


 def as_json(options={})

    super(:include => { :especialista => {include: [:persona, :especialidades]} ,:tipo_servicio => {include: :especialidad}, :horarios => {:include => :turnos,:methods => :turnos_ordenados} , :ubicacion => {}}


               )
  end

  def postearFb(difusion)

      @user_graph = Koala::Facebook::API.new('EAANVgP46xeoBAPQYTJZArDgzsX2GEuPMCJJXIJmMW5ZCrFtZC0AYGkVhs8EZB4V4rRQZCZCoWHIppy1JWGXEPT7mzwMHI9bwpTruMAYE4XPbTyuv1t9wwcCBvkJEsj6C6s84nYEq8Q2AHaeUm6odG8vZAatv4HqcEQZD')
      # retrieve collection fo all your managed pages: returns collection of hashes with page id, name, category, access token and permissions
      pages = @user_graph.get_connections('me', 'accounts')
      # get access token for first page
      @page_token = pages.first['access_token']

      # or: retrieve access_token for a given page_id
      #page_token = @user_graph.get_page_access_token(page_id)

      #@page_token = "EAACEdEose0cBAAJAIpZBEZAFqwZAXttJ8bRyrOBC5kDWC1p2RZB3DsuUkhQjUgEOZBf9ZCAMHAlHE3QYRNdToS7r3Xj6SzONxe4OThMZBSZCAfLF5L8Ve3w6xXnsiu19Bf8mAVtDdwHkJeuoovHfok8mfYBBaKbd8MmHn3gi2gClfAPqX88anAB8qUgYFxCZByGQZD"

      @page_graph = Koala::Facebook::API.new(@page_token)

      @page_graph.get_object('me') # I'm a page
      @page_graph.get_connection('me', 'feed') # the page's wall
      if(difusion.avatar.file.nil?)
        @page_graph.put_wall_post(difusion.asunto) # post as page, requires new publish_pages permission
      else
        @page_graph.put_picture(difusion.avatar.current_path, ".jpg", {:caption => difusion.asunto}, "me")
      end
      #@page_graph.put_picture(Rails.public_path+'bardenova.jpg', ".jpg", {:caption => @tipo_servicio.descripcion}, "me")
      #@page_graph.put_connections("AliceLaTrinidad", 'feed', :message => message, :picture => picture_url, :link => link_url)
      #@tipo_servicio = self


    end

    def self.contarCitas
      @citas = Servicio.joins( horarios: { turnos: :citas } ).group("servicios.descripcion").count
      return @citas
    end

    def contarCitas(estatus_nuevo, fecha_inicio, fecha_fin)
      @citas = Cita.joins(:historial_citas, turno: { horario: :servicio }).where( "horarios.servicio_id" => self.id ).where('citas.fecha' => fecha_inicio..fecha_fin)
      if estatus_nuevo != nil
         @citas = @citas.where("historial_citas.estatus_nuevo" =>  estatus_nuevo)
      end
      return @citas.count
    end

    def contarTiempoAtencion(fecha_inicio, fecha_fin)
      citas = Cita.joins(turno: { horario: :servicio }).where( "horarios.servicio_id"=> self.id ).where('citas.fecha' => fecha_inicio..fecha_fin)
      tiempoAtencion = 0
      citasAtendidas = 0
      citas.each do |cita|
        atencion = cita.historial_citas.where(:estatus_nuevo => 3).take
        if !atencion.nil?
          citasAtendidas = citasAtendidas + 1
          recepcion = cita.historial_citas.where(:estatus_nuevo => 2).take
          tiempoAtencion = tiempoAtencion + TimeDifference.between(recepcion.fecha,atencion.fecha).in_hours
        end
      end
      if citasAtendidas == 0
        return 0
      else
        return (tiempoAtencion / citasAtendidas)
      end
    end

    def self.contarTiempoAtencion(fecha_inicio, fecha_fin)
      citas = Cita.joins(turno: { horario: :servicio }).where('citas.fecha' => fecha_inicio..fecha_fin)
      tiempoAtencion = 0
      citasAtendidas = 0
      citas.each do |cita|
        atencion = cita.historial_citas.where(:estatus_nuevo => 3).take
        if !atencion.nil?
          citasAtendidas = citasAtendidas + 1
          recepcion = cita.historial_citas.where(:estatus_nuevo => 2).take
          tiempoAtencion = tiempoAtencion + TimeDifference.between(recepcion.fecha,atencion.fecha).in_hours
        end
      end
      if citasAtendidas == 0
        return 0
      else
        return (tiempoAtencion / citasAtendidas)
      end
    end

  def contarTiempoRecepcion(fecha_inicio, fecha_fin)
    citas = Cita.joins(turno: { horario: :servicio }).where( "horarios.servicio_id"=> self.id ).where('citas.fecha' => fecha_inicio..fecha_fin)
    tiempoRecepcion = 0
    citasRecibidas = 0
    citas.each do |cita|
      recepcion = cita.historial_citas.where(:estatus_nuevo => 2).take
      if !recepcion.nil?
        citasRecibidas = citasRecibidas + 1
        tiempoRecepcion = tiempoRecepcion + TimeDifference.between(cita.fecha,recepcion.fecha).in_hours
      end
    end
    if citasRecibidas == 0
      return 0
    else
      return (tiempoRecepcion / citasRecibidas)
    end

  end

  def self.contarTiempoRecepcion(fecha_inicio, fecha_fin)
    citas = Cita.joins(turno: { horario: :servicio }).where('citas.fecha' => fecha_inicio..fecha_fin)
    tiempoRecepcion = 0
    citasRecibidas = 0
    citas.each do |cita|
      recepcion = cita.historial_citas.where(:estatus_nuevo => 2).take
      if !recepcion.nil?
        citasRecibidas = citasRecibidas + 1
        tiempoRecepcion = tiempoRecepcion + TimeDifference.between(cita.fecha,recepcion.fecha).in_hours
      end
    end
    if citasRecibidas == 0
      return 0
    else
      return (tiempoRecepcion / citasRecibidas)
    end

  end

  def contarTiempoSolicitud(fecha_inicio, fecha_fin)
    citas = Cita.joins(turno: { horario: :servicio }).where( "horarios.servicio_id"=> self.id ).where('citas.fecha' => fecha_inicio..fecha_fin)
    tiempoSolicitud = 0
    citasSolicitadas = 0
    citas.each do |cita|
        citasSolicitadas = citasSolicitadas + 1
        tiempoSolicitud = tiempoSolicitud + TimeDifference.between(cita.created_at,cita.fecha).in_hours
    end
    if citasSolicitadas == 0
      return 0
    else
      return (tiempoSolicitud / citasSolicitadas)
    end

  end

  def self.contarTiempoSolicitud(fecha_inicio, fecha_fin)
    citas = Cita.joins(turno: { horario: :servicio }).where('citas.fecha' => fecha_inicio..fecha_fin)
    tiempoSolicitud = 0
    citasSolicitadas = 0
    citas.each do |cita|
        citasSolicitadas = citasSolicitadas + 1
        tiempoSolicitud = tiempoSolicitud + TimeDifference.between(cita.created_at,cita.fecha).in_hours
    end
    if citasSolicitadas == 0
      return 0
    else
      return (tiempoSolicitud / citasSolicitadas)
    end

  end

  def contarTiempoEvaluacion(fecha_inicio, fecha_fin)
    citas = Cita.joins(turno: { horario: :servicio }).where( "horarios.servicio_id"=> self.id ).where('citas.fecha' => fecha_inicio..fecha_fin)
    tiempoEvaluacion = 0
    citasEvaluadas = 0
    citas.each do |cita|
      evaluacion = cita.historial_citas.where(:estatus_nuevo => 4).take
      if !evaluacion.nil?
        citasEvaluadas = citasEvaluadas + 1
        atencion = cita.historial_citas.where(:estatus_nuevo => 3).take
        tiempoEvaluacion = tiempoEvaluacion + TimeDifference.between(atencion.fecha,evaluacion.fecha).in_hours
      end
    end
    if citasEvaluadas == 0
      return 0
    else
      return (tiempoEvaluacion / citasEvaluadas)
    end

  end

  def self.contarTiempoEvaluacion(fecha_inicio, fecha_fin)
    citas = Cita.joins(turno: { horario: :servicio }).where('citas.fecha' => fecha_inicio..fecha_fin)
    tiempoEvaluacion = 0
    citasEvaluadas = 0
    citas.each do |cita|
      evaluacion = cita.historial_citas.where(:estatus_nuevo => 4).take
      puts "HOLA*********" + evaluacion.inspect
      if !evaluacion.nil?
        citasEvaluadas = citasEvaluadas + 1
        atencion = cita.historial_citas.where(:estatus_nuevo => 3).take
        tiempoEvaluacion = tiempoEvaluacion + TimeDifference.between(atencion.fecha,evaluacion.fecha).in_hours
      end
    end
    if citasEvaluadas == 0
      return 0
    else
      return (tiempoEvaluacion / citasEvaluadas)
    end

  end

  def contarCitasCanceladasDeTipoMotivo(tipo_motivo,fecha_inicio,fecha_fin)
    @citas = Cita.joins(eventualidad: { motivo: :tipo_motivo}, turno: { horario: :servicio }).where( "horarios.servicio_id"=> self.id ).where('citas.fecha' => fecha_inicio..fecha_fin).where('citas.estatus' => 5).where('motivos.tipo_motivo_id' => tipo_motivo)

    return @citas.count
  end

  def promedioDeCitasCanceladasPorTipoMotivo(fecha_inicio, fecha_fin)
    @citas = Cita.joins(eventualidad: { motivo: :tipo_motivo}, turno: { horario: :servicio }).where( "horarios.servicio_id"=> self.id ).where('citas.fecha' => fecha_inicio..fecha_fin).where('citas.estatus' => 5)
    @tipoMotivos = TipoMotivo.all
    return (@citas.count.to_f / @tipoMotivos.count.to_f)
  end

private
def save_horario_turnos

        @horarioNuevo = Horario.create(tiempo_cita: 0,estatus: 1, tipo_horario: TipoHorario.first,servicio_id: self.id)
       for i in 1..7
          Turno.create(horario_id: @horarioNuevo.id,cantidad_pacientes: 0,hora_inicio: "08:00:00" , hora_fin: "08:00:00",estatus: 1,dia_id: i, tipo_turno_id: 1)
          Turno.create(horario_id: @horarioNuevo.id,cantidad_pacientes: 0,hora_inicio: "13:00:00" , hora_fin: "13:00:00",estatus: 1,dia_id: i, tipo_turno_id: 2)

       end
end

def self.servicios_por_especialidad(especialidad)
  @servicios = Servicio.joins( tipo_servicio: :especialidad )
  if especialidad != nil
    @servicios = @servicios.where("especialidades.id" => especialidad)
  end
  return @servicios
end

end
