class Especialidad < ApplicationRecord
  has_many :tipo_servicios, dependent: :destroy
  belongs_to :tipo_especialidad

  has_many :especialidad_especialistas, dependent: :destroy
  has_many :especialistas, through: :especialidad_especialistas, dependent: :destroy

  def self.titulo
	  return "Especialidad"
  end

  def tipo
    return self.tipo_especialidad
  end

  def contarEspecialistas
  	@especialistas = Especialista.where(:especialidad_id => self.id)
  	return @especialistas.count
  end

  def contarServicios
  	@servicios = Servicio.joins(:tipo_servicio).where(tipo_servicios: {especialidad: self})
  	#@servicios = Servicio.joins(tipo_servicio: :especialidad).distinct
  	return @servicios.count
  end

  def self.contarServicios
  	@servicios = Especialidad.joins(tipo_servicios: :servicios).group("especialidades.descripcion").count
  	return @servicios
  end

  def contarCitas(estatus_nuevo, fecha_inicio, fecha_fin)
  	@citas = Cita.joins(:historial_citas, turno: { horario: {servicio: {tipo_servicio: :especialidad } } }).where( "tipo_servicios.especialidad_id"=> self.id ).where('citas.fecha' => fecha_inicio..fecha_fin)
  	if estatus_nuevo != nil
       @citas = @citas.where("historial_citas.estatus_nuevo" =>  estatus_nuevo) 
    end
    return @citas.count
  end

  def contarTiempoAtencion(fecha_inicio, fecha_fin)
    citas = Cita.joins(turno: { horario: {servicio: {tipo_servicio: :especialidad } } }).where( "tipo_servicios.especialidad_id"=> self.id ).where('citas.fecha' => fecha_inicio..fecha_fin)
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
    citas = Cita.joins(turno: { horario: {servicio: {tipo_servicio: :especialidad } } }).where('citas.fecha' => fecha_inicio..fecha_fin)
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
    citas = Cita.joins(turno: { horario: {servicio: {tipo_servicio: :especialidad } } }).where( "tipo_servicios.especialidad_id"=> self.id ).where('citas.fecha' => fecha_inicio..fecha_fin)
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
    citas = Cita.joins(turno: { horario: {servicio: {tipo_servicio: :especialidad } } }).where('citas.fecha' => fecha_inicio..fecha_fin)
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
    citas = Cita.joins(turno: { horario: {servicio: {tipo_servicio: :especialidad } } }).where( "tipo_servicios.especialidad_id"=> self.id ).where('citas.fecha' => fecha_inicio..fecha_fin)
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
    citas = Cita.joins(turno: { horario: {servicio: {tipo_servicio: :especialidad } } }).where('citas.fecha' => fecha_inicio..fecha_fin)
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
    citas = Cita.joins(turno: { horario: {servicio: {tipo_servicio: :especialidad } } }).where( "tipo_servicios.especialidad_id"=> self.id ).where('citas.fecha' => fecha_inicio..fecha_fin)
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
    citas = Cita.joins(turno: { horario: {servicio: {tipo_servicio: :especialidad } } }).where('citas.fecha' => fecha_inicio..fecha_fin)
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

  def self.contarCitas
    @citas = Especialidad.joins(tipo_servicios: { servicios: { horarios: { turnos: :citas } } } ).group("especialidades.descripcion")
    return @citas.count
  end

  def contarCitasCanceladasDeTipoMotivo(tipo_motivo,fecha_inicio,fecha_fin)
    @citas = Cita.joins(eventualidad: { motivo: :tipo_motivo}, turno: { horario: {servicio: {tipo_servicio: :especialidad } } }).where( "tipo_servicios.especialidad_id"=> self.id ).where('citas.fecha' => fecha_inicio..fecha_fin).where('citas.estatus' => 5).where('motivos.tipo_motivo_id' => tipo_motivo)

    return @citas.count
  end

  def promedioDeCitasCanceladasPorTipoMotivo(fecha_inicio, fecha_fin)
    @citas = Cita.joins(eventualidad: { motivo: :tipo_motivo}, turno: { horario: {servicio: {tipo_servicio: :especialidad } } }).where( "tipo_servicios.especialidad_id"=> self.id ).where('citas.fecha' => fecha_inicio..fecha_fin).where('citas.estatus' => 5)
    @tipoMotivos = TipoMotivo.all
    return (@citas.count.to_f / @tipoMotivos.count.to_f)
  end
end
