class TipoPregunta < ApplicationRecord
	has_many :preguntas
  def self.titulo
	  return "Tipo de Pregunta"
  end

end
