class TipoServicio < ApplicationRecord
	belongs_to :tipo_atencion
  belongs_to :categoria
  belongs_to :especialidad
  has_many :servicios, dependent: :destroy
  has_many :tipo_servicio_evento, dependent: :destroy
  has_many :eventos, through: :tipo_servicio_evento, dependent: :destroy
  has_many :criterio_tipo_servicios, dependent: :destroy
  has_many :criterios, through: :criterio_tipo_servicios, dependent: :destroy
  has_many :perfil_tipo_servicios, dependent: :destroy
  has_many :perfiles, through: :perfil_tipo_servicios, dependent: :destroy

	has_attached_file :foto, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/

  	after_save :save_criterios, :save_perfiles

    attr_reader :criteriosTipoServicio, :perfilesTipoServicio

     extend FriendlyId
     friendly_id :descripcion, use: :slugged

    def criteriosTipoServicio=(value)
      @criteriosTipoServicio = value
    end

    def perfilesTipoServicio=(value)
      @perfilesTipoServicio = value
    end

    def difundirSegmentado(difusion)
      if Configuracion.envia_email
        self.destinatariosSegmentados.each do |destinatario|
           ExampleMailer.difusion(difusion,destinatario[1]).deliver_later
        end
      end
    end

    def difundirGeneral(difusion)
      if Configuracion.envia_email
        self.destinatariosGeneral.each do |destinatario|
           ExampleMailer.difusion(difusion,destinatario[1]).deliver_later
        end
      end
    end

    def notificarSegmentado(difusion)
      if Configuracion.envia_notificaciones
        self.destinatariosSegmentados.each do |destinatario|
          if Persona.find(destinatario[0]).usuario != nil
           if difusion.tipo_entidad_id == 1
              Notificacion.create(descripcion:"Servicio", mensaje: difusion.asunto, url:difusion.entidad_id, usuario_id:(Persona.find(destinatario[0])).usuario.id, tipo_notificacion_id: 2, entidad_id: difusion.entidad_id )
            else
              Notificacion.create(descripcion:"Servicio", mensaje: difusion.asunto, url:difusion.entidad_id, usuario_id:(Persona.find(destinatario[0])).usuario.id, tipo_notificacion_id: 3, entidad_id: difusion.entidad_id )
            end
          end
        end
      end
    end

    def notificarGeneral(difusion)
      if Configuracion.envia_notificaciones
        self.destinatariosGeneral.each do |destinatario|
          if Persona.find(destinatario[0]).usuario != nil
             if difusion.tipo_entidad_id == 1
              Notificacion.create(descripcion:"Servicio", mensaje: difusion.asunto, url:difusion.entidad_id, usuario_id:(Persona.find(destinatario[0])).usuario.id, tipo_notificacion_id: 2, entidad_id: difusion.entidad_id )
            else
              Notificacion.create(descripcion:"Servicio", mensaje: difusion.asunto, url:difusion.entidad_id, usuario_id:(Persona.find(destinatario[0])).usuario.id, tipo_notificacion_id: 3, entidad_id: difusion.entidad_id )
            end
          end
        end
      end
    end



    def destinatariosSegmentados
      destinatarios = {}
      self.perfiles.each do |perfil|

        perfil.adicciones.each do |adiccion|
          destinatarios.merge!(adiccion.personas.map { |c| [c.id, c.email]  }.to_h)
        end

        perfil.cirugias.each do |cirugia|
          destinatarios.merge!(cirugia.personas.map { |c| [c.id, c.email]  }.to_h)
        end

        perfil.discapacidades.each do |discapacidad|
          destinatarios.merge!(discapacidad.personas.map { |c| [c.id, c.email]  }.to_h)
        end

        perfil.estado_civiles.each do |estado_civil|
          destinatarios.merge!(estado_civil.personas.map { |c| [c.id, c.email]  }.to_h)
        end

        perfil.grupo_sanguineos.each do |grupo_sanguineo|
          destinatarios.merge!(grupo_sanguineo.personas.map { |c| [c.id, c.email]  }.to_h)
        end

        perfil.habitos.each do |habito|
          destinatarios.merge!(habito.personas.map { |c| [c.id, c.email]  }.to_h)
        end

        perfil.lesiones.each do |lesion|
          destinatarios.merge!(lesion.personas.map { |c| [c.id, c.email]  }.to_h)
        end

        perfil.ocupaciones.each do |ocupacion|
          destinatarios.merge!(ocupacion.personas.map { |c| [c.id, c.email]  }.to_h)
        end

        perfil.patologias.each do |patologia|
          destinatarios.merge!(patologia.personas.map { |c| [c.id, c.email]  }.to_h)
        end

        perfil.profesiones.each do |profesion|
          destinatarios.merge!(profesion.personas.map { |c| [c.id, c.email]  }.to_h)
        end

        perfil.rango_edades.each do |rango_edad|
          destinatarios.merge!(rango_edad.personas.map { |c| [c.id, c.email]  }.to_h)
        end

        perfil.rango_pesos.each do |rango_peso|
          destinatarios.merge!(rango_peso.personas.map { |c| [c.id, c.email]  }.to_h)
        end

        perfil.sexos.each do |sexo|
          destinatarios.merge!(sexo.personas.map { |c| [c.id, c.email]  }.to_h)
        end

        perfil.vacunas.each do |vacuna|
          destinatarios.merge!(vacuna.personas.map { |c| [c.id, c.email]  }.to_h)
        end
      end

      destinatarios.delete_if{|key,value| value == ""}

      return destinatarios
    end

    def destinatariosGeneral
      destinatarios = {}
      destinatarios = Persona.all.map { |c| [c.id, c.email]  }.to_h
      return destinatarios
    end


   def self.contarCitas
      @citas = TipoServicio.joins(servicios: { horarios: { turnos: :citas } } ).group("tipo_servicios.descripcion").count
      return @citas
    end

    def contarCitas(estatus_nuevo, fecha_inicio, fecha_fin)
      @citas = Cita.joins(:historial_citas, turno: { horario: {servicio: :tipo_servicio } }).where( "tipo_servicios.id"=> self.id ).where('citas.fecha' => fecha_inicio..fecha_fin)
      if estatus_nuevo != nil
         @citas = @citas.where("historial_citas.estatus_nuevo" =>  estatus_nuevo)
      end
      return @citas.count
    end

    def contarTiempoAtencion(fecha_inicio, fecha_fin)
      citas = Cita.joins(turno: { horario: {servicio: :tipo_servicio } }).where( "tipo_servicios.id"=> self.id ).where('citas.fecha' => fecha_inicio..fecha_fin)
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
      citas = Cita.joins(turno: { horario: {servicio: :tipo_servicio } }).where('citas.fecha' => fecha_inicio..fecha_fin)
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
    citas = Cita.joins(turno: { horario: {servicio: :tipo_servicio } }).where( "tipo_servicios.id"=> self.id ).where('citas.fecha' => fecha_inicio..fecha_fin)
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
    citas = Cita.joins(turno: { horario: {servicio: :tipo_servicio } }).where('citas.fecha' => fecha_inicio..fecha_fin)
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
    citas = Cita.joins(turno: { horario: {servicio: :tipo_servicio } }).where( "tipo_servicios.id"=> self.id ).where('citas.fecha' => fecha_inicio..fecha_fin)
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
    citas = Cita.joins(turno: { horario: {servicio: :tipo_servicio } }).where('citas.fecha' => fecha_inicio..fecha_fin)
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
    citas = Cita.joins(turno: { horario: {servicio: :tipo_servicio } }).where( "tipo_servicios.id"=> self.id ).where('citas.fecha' => fecha_inicio..fecha_fin)
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
    citas = Cita.joins(turno: { horario: {servicio: :tipo_servicio } }).where('citas.fecha' => fecha_inicio..fecha_fin)
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

  def contarCitasCanceladasDeTipoMotivo(tipo_motivo,fecha_inicio,fecha_fin)
    @citas = Cita.joins(eventualidad: { motivo: :tipo_motivo}, turno: { horario: {servicio: :tipo_servicio } }).where( "tipo_servicios.id"=> self.id ).where('citas.fecha' => fecha_inicio..fecha_fin).where('citas.estatus' => 5).where('motivos.tipo_motivo_id' => tipo_motivo)

    return @citas.count
  end

  def promedioDeCitasCanceladasPorTipoMotivo(fecha_inicio, fecha_fin)
    @citas = Cita.joins(eventualidad: { motivo: :tipo_motivo}, turno: { horario: {servicio: :tipo_servicio } }).where( "tipo_servicios.id"=> self.id ).where('citas.fecha' => fecha_inicio..fecha_fin).where('citas.estatus' => 5)
    @tipoMotivos = TipoMotivo.all
    return (@citas.count.to_f / @tipoMotivos.count.to_f)
  end
    


   private
   def save_criterios
    CriterioTipoServicio.where(:tipo_servicio_id => self.id).destroy_all
    if !@criteriosTipoServicio.nil?
        @criteriosTipoServicio.each do |criterio_id|
          CriterioTipoServicio.create(criterio_id: criterio_id, tipo_servicio_id: self.id )
        end
     end
   end

   private
   def save_perfiles
    PerfilTipoServicio.where(:tipo_servicio_id => self.id).destroy_all
    if !@perfilesTipoServicio.nil?
        @perfilesTipoServicio.each do |perfil_id|
          PerfilTipoServicio.create(perfil_id: perfil_id, tipo_servicio_id: self.id )
        end
     end
   end

  def self.titulo
    return "Tipo de Servicio"
  end

end
