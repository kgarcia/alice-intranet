class TipoEvaluacion < ApplicationRecord
 has_many :evaluaciones
  def self.titulo
	  return "Tipo de Evaluación"
  end
end
