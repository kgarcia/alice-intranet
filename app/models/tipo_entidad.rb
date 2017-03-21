class TipoEntidad < ApplicationRecord
	has_many :entidades
	def self.titulo
	  return "Tipo de Entidad"
  end
end
