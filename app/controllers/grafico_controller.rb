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

  def evaluaciones_por_paciente
    @especialidades = Especialidad.all
    render "grafico/pie-basic"
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
    #puts :especialidad_id.inspect
    @calificacionesOK = []
    @calificaciones = Calificacion.all
    @calificacionesEspecialidades = []
    @calificacionesCriterios = []
    @criterio = Criterio.find(params[:criterio_id])
    @data = Hash.new
    @data["muymal"] = 0
    @data["mal"] = 0
    @data["regular"] = 0
    @data["bueno"] = 0
    @data["muybueno"] = 0
    @calificaciones.each do |calificacion|
      #validando data segun parametros seleccionados
      @evaluacion = Evaluacion.find(calificacion.evaluacion_id)
      @cita = Cita.find(@evaluacion.cita_id)
      @turno = Turno.find(@cita.turno_id)
      if @turno.tipo_turno_id.to_s.eql?(params[:tipo_turno_id])
        @horario = Horario.find(@turno.horario_id)
        @servicio = Servicio.find(@horario.servicio_id)
        @tipo_servicio = TipoServicio.find(@servicio.tipo_servicio_id)
        @calificacionesEspecialidades.push(calificacion)
        if @tipo_servicio.especialidad_id.to_s.eql?(params[:especialidad_id])
          @calificacionesCriterios.push(calificacion)
          if calificacion.criterio_id.to_s.eql?(params[:criterio_id])
            #preparando data de la grafica...
            if calificacion.descripcion.eql? "1"
              @data["muymal"] = @data["muymal"] + 1
            end
            if calificacion.descripcion.eql? "2"
              @data["mal"] = @data["mal"] + 1
            end
            if calificacion.descripcion.eql? "3"
              @data["regular"] = @data["regular"] + 1
            end
            if calificacion.descripcion.eql? "4"
              @data["bueno"] = @data["bueno"] + 1
            end
            if calificacion.descripcion.eql? "5"
              @data["muybueno"] = @data["muybueno"] + 1
            end
            @calificacionesOK.push(calificacion)
          end
          #FALTA EVALUAR QUE LAS CITAS TENGAN LA FECHA EN EL RANGO SELECCIONADO
        end
      end
    end
    puts "total grafica: " + @data.inspect
    puts "Calificaciones totales: " + @calificaciones.length.to_s
    puts "Calificaciones especificas: " + @calificacionesOK.length.to_s
    puts "Calificaciones por especialidades: " + @calificacionesEspecialidades.length.to_s
    puts "Calificaciones por criterios: " + @calificacionesCriterios.length.to_s
    @totalCalificaciones = @calificaciones.length
    @totalSeleccionado = ((@calificacionesOK.length.to_f / @totalCalificaciones) * 100).round(2)
    @especialidades = Especialidad.all
    render "grafico/calificaciones_por_criterio"
  end

end
