class TipoPregunta < ApplicationRecord
	has_many :preguntas, dependent: :destroy
  def self.titulo
	  return "Tipo de Pregunta"
  end

end
