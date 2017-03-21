class RangoPeso < ApplicationRecord
	has_many :rango_peso_perfiles
  	has_many :perfiles, through: :rango_peso_perfiles

	def self.titulo
	  return "Rango de Peso"
  	end

  	def personas
    	personas = []
        Persona.all.each { |persona| personas << persona if persona.peso.between?(self.peso_inicial,self.peso_final) }
    	return personas
    end
end
