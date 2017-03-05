class GraficoController < ApplicationController
  require 'descriptive_statistics'

  def generar
  end

  def ver
  	@especialidades = Especialidad.contarServicios
  	@estadisticas =  @especialidades.descriptive_statistics
  	@titulo = "Servicios por especialidad"

  end
end
