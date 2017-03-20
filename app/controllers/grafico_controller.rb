class GraficoController < ApplicationController
  require 'descriptive_statistics'

  def generar
  end

  def citas_por_especialidad
  	@especialidades = Especialidad.contarCitas
  	@estadisticas =  @especialidades.descriptive_statistics

    @tipoServicios = TipoServicio.contarCitas
    @estadisticasTipoServicios =  @tipoServicios.descriptive_statistics

    @estatuses = Cita.contarEstatus

    @motivos = Motivo.contarCitas

    @dias = Dia.contarCitas

    @turnos = TipoTurno.contarCitas

    @sexos = Sexo.contarCitas

    @patologias = Patologia.contarCitas

    @ocupaciones = Ocupacion.contarCitas

    @profesiones = Profesion.contarCitas

  	@titulo = "Citas por especialidad"
  	render "grafico/citas_por_especialidad"
  end

  def criterios_servicio
  	@servicio = Servicio.find(1)
  	@criterios = @servicio.tipo_servicio.criterios
  	@titulo = "Criterios del tipo de servicio"
  	render "grafico/pie"
  end

  def citas_por_turno
  	@citas = Turno.contarCitasTurno
  	@titulo = "Citas por Turno"
  	render "grafico/heat"
  end

  def reporte_por_criterios
    @especialidades = Especialidad.all
    render "grafico/reporte-criterios"
  end

  def calificaciones_por_criterio
    @especialidades = Especialidad.all
    #render "grafico/calificaciones_por_criterio"
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def citas_evaluadas_params
    params.permit(:descripcion, :especialidad_id, :tipo_turno_id, :criterio_id, :fecha_inicio, :fecha_fin)
  end

  def generar_citas_evaluadas
    @criterio = Criterio.find(params[:criterio_id])
    @tipo_turno = TipoTurno.find(params[:tipo_turno_id])
    @especialidad = Especialidad.find(params[:especialidad_id])
    @fecha_inicio = params[:fecha_inicio]['day'] + "/" + params[:fecha_inicio]['month'] + "/" + params[:fecha_inicio]['year']
    @fecha_fin = params[:fecha_fin]['day'] + "/" + params[:fecha_fin]['month'] + "/" + params[:fecha_fin]['year']

    @cal_sexos =  { "Hombres" => Calificacion.cantidadCalificacionesPorSexo(1), "Mujeres" => Calificacion.cantidadCalificacionesPorSexo(2)}
    @cal_estado_civiles = { "Soltero/a" => Calificacion.cantidadCalificacionesPorEstadoCivil(1), "Casado/a" => Calificacion.cantidadCalificacionesPorEstadoCivil(2), "Divorciado/a" => Calificacion.cantidadCalificacionesPorEstadoCivil(3), "Viudo/a" => Calificacion.cantidadCalificacionesPorEstadoCivil(4), "Comprometido/a" => Calificacion.cantidadCalificacionesPorEstadoCivil(5)}
    @estadisticas =  @cal_sexos.descriptive_statistics
    @cal_estado_civiles.descriptive_statistics
    render "grafico/calificaciones_por_criterio"
  end

end
