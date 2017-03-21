class TipoHabito < ApplicationRecord
	has_many :habitos, dependent: :destroy

	def self.titulo
		return "Tipo de Hábito"
	end
end
