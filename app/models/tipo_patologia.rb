class TipoPatologia < ApplicationRecord
	has_many :patologias
  def self.titulo
	  return "Tipo de Patología"
  end
end
