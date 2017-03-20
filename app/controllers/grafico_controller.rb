class GraficoController < ApplicationController
  require 'descriptive_statistics'

  def generar
  end

  def citas_solicitadas
    @especialidades = Especialidad.where(:estatus => 1)
  end

  def generar_citas_solicitadas
    #@especialidades = Especialidad.where(:estatus => 1)
    @rango = params['fecha'].split(' - ')
    @fecha_inicio =  @rango[0].to_date.beginning_of_day()
    @fecha_fin =  @rango[1].to_date.end_of_day()
    @tipo_entidad = params[:tipo_entidad]
    @entidad = params[:entidad]

    case @tipo_entidad
      when 1.to_s
        if @entidad == ""
          @titulo = "Efectividad de Citas por Especialidad"
          @especialidades2 = Especialidad.contarCitas
          @especialidades = Especialidad.all
          @estadisticas =  @especialidades2.descriptive_statistics
        else
          @especialidad = Especialidad.find(@entidad.to_i)
          @titulo = "Efectividad de Citas por Especialidad: "+@especialidad.descripcion

        end

      when 2.to_s
        if @entidad == ""
          @titulo = "Efectividad de Citas por Tipo de Servicio"
          @tipoServicios2 = TipoServicio.contarCitas
          @tipoServicios = TipoServicio.all
          @estadisticas =  @tipoServicios2.descriptive_statistics
        else
          @tipoServicio = TipoServicio.find(@entidad.to_i)
          @titulo = "Efectividad de Citas por Tipo de Servicio: "+@tipoServicio.descripcion

        end
      when 3.to_s
        if @entidad == ""
          @titulo = "Efectividad de Citas por Servicio"
          @servicios2 = Servicio.contarCitas
          @servicios = Servicio.all
          @estadisticas =  @servicios2.descriptive_statistics
        else
          @servicio = Servicio.find(@entidad.to_i)
          @titulo = "Efectividad de Citas por Servicio: "+@servicio.descripcion

        end
    end

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
    @rango = params['fecha'].split(' - ')
    @fecha_inicio =  @rango[0].to_date.beginning_of_day()
    @fecha_fin =  @rango[1].to_date.end_of_day()

    @cal_sexos =  { "Hombres" => Calificacion.cantidadCalificacionesPorSexo(1, @fecha_inicio, @fecha_fin), "Mujeres" => Calificacion.cantidadCalificacionesPorSexo(2, @fecha_inicio, @fecha_fin)}
    @cal_estado_civiles = { "Soltero/a" => Calificacion.cantidadCalificacionesPorEstadoCivil(1, @fecha_inicio, @fecha_fin), "Casado/a" => Calificacion.cantidadCalificacionesPorEstadoCivil(2, @fecha_inicio, @fecha_fin), "Divorciado/a" => Calificacion.cantidadCalificacionesPorEstadoCivil(3, @fecha_inicio, @fecha_fin), "Viudo/a" => Calificacion.cantidadCalificacionesPorEstadoCivil(4, @fecha_inicio, @fecha_fin), "Comprometido/a" => Calificacion.cantidadCalificacionesPorEstadoCivil(5, @fecha_inicio, @fecha_fin)}
    @estadisticas =  @cal_sexos.descriptive_statistics
    @cal_estado_civiles.descriptive_statistics
    render "grafico/calificaciones_por_criterio"
  end

  def update_entidades

    case params[:tipo_entidad].to_i
      when 1
        @entidades = Especialidad.where(:estatus => 1)
      when 2
        @entidades = TipoServicio.where(:estatus => 1)
      when 3
        @entidades = Servicio.where(:estatus => 1)
    end
    respond_to do |format|
      format.js
      render 'grafico/update_entidades'
    end
  end

  def calificaciones_por_especialidad
    render "grafico/reporte-calificaciones-especialidades"
  end

  def calcular_calificaciones_por_especialidad
    @tipo_turno = TipoTurno.find(params[:tipo_turno_id])
    @rango = params['fecha'].split(' - ')
    @fecha_inicio =  @rango[0].to_date.beginning_of_day()
    @fecha_fin =  @rango[1].to_date.end_of_day()

    @especialidades = Especialidad.all
    render "grafico/calificaciones_por_especialidad"
  end

end
