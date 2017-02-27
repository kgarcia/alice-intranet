class Pregunta < ApplicationRecord
  belongs_to :tipo_pregunta
  def self.titulo
	  return "Preguntas"
  end
end
