class GraficoController < ApplicationController
  require 'descriptive_statistics'

  def generar
  end

  def citas_solicitadas
    @especialidades = Especialidad.where(:estatus => 1)
  end

  def generar_citas_solicitadas
    #@especialidades = Especialidad.where(:estatus => 1)
    @especialidades = Especialidad.contarCitas
    @estadisticas =  @especialidades.descriptive_statistics
    @rango = params['fecha'].split(' - ')
    @fecha_inicio =  @rango[0].to_date.beginning_of_day()
    @fecha_fin =  @rango[1].to_date.end_of_day()
    @tipo_entidad = params[:tipo_entidad]
    @entidad = params[:entidad]

    case @tipo_entidad
      when 1.to_s
        puts "Especialidad"
        
      when 2.to_s
        puts "TipoServicio"
        
      when 3.to_s
        puts "Servicio"    
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

  def evaluaciones_por_paciente
    @titulo = "Evaluaciones por paciente"
    @especialidades = Especialidad.all
    render "grafico/pie-basic"
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

end
