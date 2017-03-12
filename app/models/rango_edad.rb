class RangoEdad < ApplicationRecord
	has_many :rango_edad_perfiles
  	has_many :perfiles, through: :rango_edad_perfiles

	def self.titulo
	  return "Rango de Edad"
  end
end
