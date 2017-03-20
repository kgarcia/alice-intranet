class Calificacion < ApplicationRecord
  belongs_to :tipo_calificacion
  belongs_to :criterio
  belongs_to :evaluacion
  def tipo
  	return self.tipo_calificacion
  end

  def self.titulo
		return "Calificación"
	end

	def self.contarCalificaciones(especialidad,  criterio, calificacion)
    @calificaciones = Calificacion.joins(evaluacion: { cita: { turno: { horario: {servicio: {tipo_servicio: :especialidad } } } }})
    
    if calificacion != nil
    	@calificaciones.where( "calificaciones.descripcion"=> calificacion)
    end

    if especialidad != nil
    	@calificaciones.where("especialidades.id" => especialidad)
    end
    if criterio != nil
    	@calificaciones.where("criterios.id" => criterio)
    end
    
    return @calificaciones.count
  end
end
