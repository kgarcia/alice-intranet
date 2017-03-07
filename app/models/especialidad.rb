class Especialidad < ApplicationRecord
  has_many :especialistas
  has_many :tipo_servicios

  def self.titulo
	  return "Especialidades"
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
    @citas = Especialidad.joins(tipo_servicios: { servicios: { horario: { turnos: :citas } } } ).group("especialidades.descripcion").count
    return @citas
  end
end
