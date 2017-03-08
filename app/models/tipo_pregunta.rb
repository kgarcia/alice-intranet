class TipoPregunta < ApplicationRecord
	has_many :preguntas
  def self.titulo
	  return "Tipos de Pregunta"
  end

end
