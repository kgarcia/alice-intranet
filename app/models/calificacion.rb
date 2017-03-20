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

	def self.contarCalificaciones(especialidad,  criterio, calificacion, tipo_turno)
    @calificaciones = Calificacion.joins(evaluacion: { cita: { :turno => [:tipo_turno, horario: {servicio: { :tipo_servicio => [:especialidad, :criterios] } } ] } } )
    if calificacion != nil
    	@calificaciones = @calificaciones.where( "calificaciones.descripcion" => calificacion.to_s)
    end
    if especialidad != nil
    	@calificaciones = @calificaciones.where("especialidades.id" => especialidad)
    end
    if criterio != nil
    	@calificaciones = @calificaciones.where("criterios.id" => criterio)
    end
    if tipo_turno != nil
      @calificaciones = @calificaciones.where("tipo_turnos.id" => tipo_turno)
    end
    return @calificaciones.count
  end

  def self.promedioEspecialidades(especialidad, calificacion, tipo_turno)
    promedio = (Calificacion.contarCalificaciones(especialidad, nil, calificacion, tipo_turno).to_f / Calificacion.contarCalificaciones(nil, nil, calificacion, tipo_turno)) *100
    return promedio
  end

  def self.promedioCriterios(criterio, calificacion, tipo_turno)
    promedio = (Calificacion.contarCalificaciones(nil, criterio, calificacion, tipo_turno).to_f / Calificacion.contarCalificaciones(nil, nil, calificacion, tipo_turno)) *100
    return promedio
  end

  def self.promedioCriterioEspecifico(especialidad, criterio, calificacion, tipo_turno)
    promedio = (Calificacion.contarCalificaciones(especialidad, criterio, calificacion, tipo_turno).to_f / Calificacion.contarCalificaciones(especialidad, criterio, nil, tipo_turno)) *100
    return promedio
  end

  def self.cantidadCalificacionesPorSexo(sexo)
    @calificaciones = Calificacion.joins(evaluacion: { cita: { persona: :sexo } } )
    @calificaciones = @calificaciones.where("sexos.id" => sexo)
    return @calificaciones.count
  end

  def self.cantidadCalificacionesPorEstadoCivil(estado_civil)
    @calificaciones = Calificacion.joins(evaluacion: { cita: { persona: :estado_civil } } )
    @calificaciones = @calificaciones.where("estado_civiles.id" => estado_civil)
    return @calificaciones.count
  end

end
