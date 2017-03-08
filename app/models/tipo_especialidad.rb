class TipoEspecialidad < ApplicationRecord
	has_many :especialidades
	def self.titulo
	  return "Sub Especialidad"
    end
end
