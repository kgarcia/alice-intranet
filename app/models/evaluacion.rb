class Evaluacion < ApplicationRecord
  belongs_to :tipo_evaluacion

  def tipo
  	return self.tipo_evaluacion
  end
  def self.titulo
	  return "Evaluaciones"
  end
end
