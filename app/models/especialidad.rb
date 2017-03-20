class Especialidad < ApplicationRecord
  has_many :tipo_servicios
  belongs_to :tipo_especialidad

  has_many :especialidad_especialistas
  has_many :especialistas, through: :especialidad_especialistas

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

  def contarCitasChequeadas
    @citas = Cita.joins(:historial_citas, turno: { horario: {servicio: {tipo_servicio: :especialidad } } } ).where( "tipo_servicios.especialidad_id"=> self.id).where( "historial_citas.estatus_nuevo"=>  2)
    return @citas.count
  end

  def contarCitasAtendidas
    @citas = Cita.joins(:historial_citas, turno: { horario: {servicio: {tipo_servicio: :especialidad } } } ).where( "tipo_servicios.especialidad_id"=> self.id).where( "historial_citas.estatus_nuevo"=>  3)
    return @citas.count
  end

  def contarCitasEvaluadas
    @citas = Cita.joins(:historial_citas, turno: { horario: {servicio: {tipo_servicio: :especialidad } } } ).where( "tipo_servicios.especialidad_id"=> self.id).where( "historial_citas.estatus_nuevo"=>  4)
    return @citas.count
  end

  def contarCitasCanceladas
    @citas = Cita.joins(:historial_citas, turno: { horario: {servicio: {tipo_servicio: :especialidad } } } ).where( "tipo_servicios.especialidad_id"=> self.id).where( "historial_citas.estatus_nuevo"=>  5)
    return @citas.count
  end

  def self.contarCitas
    @citas = Especialidad.joins(tipo_servicios: { servicios: { horarios: { turnos: :citas } } } ).group("especialidades.descripcion")
    return @citas.count
  end
end
