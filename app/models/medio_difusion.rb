class MedioDifusion < ApplicationRecord
  has_many :difusion_medio_difusion, dependent: :destroy
  has_many :difusiones, through: :difusion_medio_difusion, dependent: :destroy

	def self.titulo
		return "Medio de Difusión"
	end
end
