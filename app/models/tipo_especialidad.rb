class TipoEspecialidad < ApplicationRecord
	has_many :especialidades
	
	def self.titulo
	  return "Tipo de Especialidad"
    end
end
