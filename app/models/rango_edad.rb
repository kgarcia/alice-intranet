class RangoEdad < ApplicationRecord
	has_many :rango_edad_perfiles, dependent: :destroy
  	has_many :perfiles, through: :rango_edad_perfiles, dependent: :destroy
    has_many :personas, dependent: :destroy

	def self.titulo
	  return "Rango de Edad"
    end

    def personas
    	personas = []
        Persona.all.each { |persona| personas << persona if persona.edad.between?(self.edad_inicial,self.edad_final) }
    	return personas
    end

end
