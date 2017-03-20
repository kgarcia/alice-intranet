class TipoDifusion < ApplicationRecord
	has_many :tipo_difusiones
	def self.titulo
	  return "Tipo de Difusión"
  end
end
