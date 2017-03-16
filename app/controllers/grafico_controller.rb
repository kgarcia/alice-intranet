class GraficoController < ApplicationController
  require 'descriptive_statistics'

  def generar
  end

  def citas_por_especialidad
  	@especialidades = Especialidad.contarCitas
  	@estadisticas =  @especialidades.descriptive_statistics
  	@titulo = "Citas por especialidad"
  	render "grafico/barra"
  end

  def criterios_servicio
  	@servicio = Servicio.find(1)
  	@criterios = @servicio.tipo_servicio.criterios
  	@titulo = "Criterios del tipo de servicio"
  	render "grafico/pie"
  end

  def citas_por_turno
  	@citas = Turno.contarCitas
  	@titulo = "Citas por Turno"
  	render "grafico/heat"
  end

  def evaluaciones_por_paciente
    @titulo = "Evaluaciones por paciente"
    render "grafico/pie-basic"
  end
end
