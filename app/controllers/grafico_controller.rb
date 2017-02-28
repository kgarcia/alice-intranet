class GraficoController < ApplicationController
  def generar
  end

  def ver
  	@especialidades = Especialidad.contarServicios

  	@titulo = "Citas por especialidad"
  end
end
