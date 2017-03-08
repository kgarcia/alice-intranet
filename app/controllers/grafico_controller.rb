class GraficoController < ApplicationController
  require 'descriptive_statistics'

  def generar
  end

  def ver
  	@especialidades = Especialidad.contarCitas
  	@estadisticas =  @especialidades.descriptive_statistics
  	@titulo = "Citas por especialidad"

  end
end
