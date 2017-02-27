class TipoPatologia < ApplicationRecord
	has_many :patologias
  def self.titulo
	  return "Tipos de Patologia"
  end
end
