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

  def contarCitas
  	@citas = Cita.joins(turno: { horario: {servicio: {tipo_servicio: :especialidad } } }).where( tipo_servicios: { especialidad: self })
  	return @citas.count
  end

  def self.contarCitas
    @citas = Especialidad.joins(tipo_servicios: { servicios: { horarios: { turnos: :citas } } } ).group("especialidades.descripcion")
    @citas = @citas.where('tipo_servicios.id' => 4)
    @citas.where('turnos.tipo_turno_id' => 2)
    return @citas.count
  end
end
