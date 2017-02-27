class TipoHabito < ApplicationRecord
	has_many :habitos

	def self.titulo
		return "Tipos de Habito"
	end
end
