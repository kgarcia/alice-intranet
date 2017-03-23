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

	def self.contarCalificaciones(especialidad,  criterio, calificacion, tipo_turno, fecha_inicio, fecha_fin)
    @calificaciones = Calificacion.joins(evaluacion: { cita: { :turno => [:tipo_turno, horario: {servicio: { :tipo_servicio => [:especialidad, :criterios] } } ] } } ).where('citas.fecha' => fecha_inicio..fecha_fin)
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

  def self.promedioEspecialidades(especialidad, calificacion, tipo_turno, fecha_inicio, fecha_fin)
    denominador = Calificacion.contarCalificaciones(nil, nil, calificacion, tipo_turno, fecha_inicio, fecha_fin)
    promedio = 0
    if denominador > 0
      promedio = (Calificacion.contarCalificaciones(especialidad, nil, calificacion, tipo_turno, fecha_inicio, fecha_fin).to_f / denominador) *100
    end
    return promedio
  end

  def self.promedioCriterios(criterio, calificacion, tipo_turno, fecha_inicio, fecha_fin)
    denominador = Calificacion.contarCalificaciones(nil, nil, calificacion, tipo_turno, fecha_inicio, fecha_fin)
    promedio = 0
    if denominador > 0
      promedio = (Calificacion.contarCalificaciones(nil, criterio, calificacion, tipo_turno, fecha_inicio, fecha_fin).to_f / denominador) *100
    end
    return promedio
  end

  def self.promedioCriterioEspecifico(especialidad, criterio, calificacion, tipo_turno, fecha_inicio, fecha_fin)
    denominador = Calificacion.contarCalificaciones(especialidad, criterio, nil, tipo_turno, fecha_inicio, fecha_fin)
    promedio = 0
    if denominador > 0
      promedio = (Calificacion.contarCalificaciones(especialidad, criterio, calificacion, tipo_turno, fecha_inicio, fecha_fin).to_f / denominador) *100
    end
    return promedio
  end

  def self.cantidadCalificacionesPorSexo(sexo, fecha_inicio, fecha_fin)
    @calificaciones = Calificacion.joins(evaluacion: { cita: { persona: :sexo } } ).where('citas.fecha' => fecha_inicio..fecha_fin)
    if sexo != nil
      @calificaciones = @calificaciones.where("sexos.id" => sexo)
    end
    return @calificaciones.count
  end

  def self.cantidadCalificacionesPorEstadoCivil(estado_civil, fecha_inicio, fecha_fin)
    @calificaciones = Calificacion.joins(evaluacion: { cita: { persona: :estado_civil } } ).where('citas.fecha' => fecha_inicio..fecha_fin)
    if estado_civil != nil
      @calificaciones = @calificaciones.where("estado_civiles.id" => estado_civil)
    end
    return @calificaciones.count
  end

  def self.contarCalificacionesPorEspecialidad(tipo_turno, especialidad, calificacion, fecha_inicio, fecha_fin)
    @calificaciones = Calificacion.joins(evaluacion: { cita: { :turno => [:tipo_turno, horario: {servicio: { tipo_servicio: :especialidad } } ] } } ).where('citas.fecha' => fecha_inicio..fecha_fin)
    if tipo_turno != nil
      @calificaciones = @calificaciones.where("tipo_turnos.id" => tipo_turno)
    end
    if especialidad != nil
      @calificaciones = @calificaciones.where("especialidades.id" => especialidad)
    end
    if calificacion != nil
    	@calificaciones = @calificaciones.where( "calificaciones.descripcion" => calificacion.to_s)
    end
    return @calificaciones.count
  end

  def self.totalCalificacionesTodasLasEspecialidades(tipo_turno, calificacion, fecha_inicio, fecha_fin)
    total = 0
    @especialidades = Especialidad.all
    @especialidades.each do |especialidad|
      total = total + Calificacion.contarCalificacionesPorEspecialidad(tipo_turno, especialidad.id, calificacion, fecha_inicio, fecha_fin)
    end
    puts "DEBUG... " + total.inspect
    return total
  end

  def self.promedioCalificacionesPorEspecialidad(tipo_turno, especialidad, fecha_inicio, fecha_fin)
    total = 0
    promedio = 0
    if tipo_turno != nil and especialidad != nil
      array = [1,2,3,4,5]
      array.each do |i|
        total = total + Calificacion.contarCalificacionesPorEspecialidad(tipo_turno, especialidad, i, fecha_inicio, fecha_fin)
      end
    end
    if total > 0
      promedio = total.to_f / 5
    end
    return promedio
  end

  def self.contarCalificacionesPorServicio(servicio,  calificacion, fecha_inicio, fecha_fin)
    @calificaciones = Calificacion.joins(evaluacion: { cita: { turno: { horario: { servicio:  :tipo_servicio } } } } ).where('citas.fecha' => fecha_inicio..fecha_fin)
    if calificacion != nil
    	@calificaciones = @calificaciones.where( "calificaciones.descripcion" => calificacion.to_s)
    end
    if servicio != nil
    	@calificaciones = @calificaciones.where("servicios.id" => servicio)
    end
    return @calificaciones.count
  end

  def self.totalCalificacionesPorServicio(servicio, fecha_inicio, fecha_fin)
    array = [1, 2, 3, 4, 5]
    total = 0
    array.each do |i|
      total = total + Calificacion.contarCalificacionesPorServicio(servicio,  i, fecha_inicio, fecha_fin)
    end
    return total
  end

  def self.promedioCalificacionesPorServicio(servicio,  calificacion, fecha_inicio, fecha_fin)
    promedio = 0
    denominador = Calificacion.totalCalificacionesPorServicio(servicio, fecha_inicio, fecha_fin)
    if denominador > 0
      promedio = (Calificacion.contarCalificacionesPorServicio(servicio,  calificacion, fecha_inicio, fecha_fin).to_f / Calificacion.totalCalificacionesPorServicio(servicio, fecha_inicio, fecha_fin)) * 100
    end
    return promedio
  end

  def self.contarCalificacionesPorServicioCriterioValor(criterio, calificacion, fecha_inicio, fecha_fin)
    @calificaciones = Calificacion.joins(evaluacion: { cita: { turno: { horario: { servicio: { tipo_servicio: :criterios } } } } } ).where('citas.fecha' => fecha_inicio..fecha_fin)
    if criterio != nil
      @calificaciones = @calificaciones.where("criterios.id" => criterio)
    end
    cont = 0
    if calificacion != nil
      @calificaciones.each do |cal|
        if cal.descripcion == calificacion.to_s and cal.criterio.id == criterio
          cont = cont + 1
        end
      end
    end
    return cont
  end

  def self.calificacionesPositivas(criterio, fecha_inicio, fecha_fin)
    total = Calificacion.contarCalificacionesPorServicioCriterioValor(criterio,  4, fecha_inicio, fecha_fin) + Calificacion.contarCalificacionesPorServicioCriterioValor(criterio,  5, fecha_inicio, fecha_fin)
    return total
  end

  def self.calificacionesNegativas(criterio, fecha_inicio, fecha_fin)
    total = Calificacion.contarCalificacionesPorServicioCriterioValor(criterio, 1, fecha_inicio, fecha_fin) + Calificacion.contarCalificacionesPorServicioCriterioValor(criterio, 2, fecha_inicio, fecha_fin)
    return total
  end

end
