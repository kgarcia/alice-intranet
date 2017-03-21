class TipoHabito < ApplicationRecord
	has_many :habitos

	def self.titulo
		return "Tipo de Hábito"
	end
end
