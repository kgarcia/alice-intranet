class TipoEspecialidad < ApplicationRecord
	has_many :especialidades, dependent: :destroy
	
	def self.titulo
	  return "Tipo de Especialidad"
    end
end
