class RangoPeso < ApplicationRecord
	has_many :rango_peso_perfiles
  	has_many :perfiles, through: :rango_peso_perfiles

	def self.titulo
	  return "Rango de Peso"
  end
end
