class GraficoController < ApplicationController
  require 'descriptive_statistics'

  def generar
  end

  def ver
  	@especialidades = Especialidad.contarServicios
  	@estadisticas =  @especialidades.descriptive_statistics
  	@titulo = "Citas por especialidad"

  end
end
