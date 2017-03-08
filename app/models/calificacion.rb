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
end
