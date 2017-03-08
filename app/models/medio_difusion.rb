class MedioDifusion < ApplicationRecord
  has_many :difusion_medio_difusion
  has_many :difusiones, through: :difusion_medio_difusion

	def self.titulo
		return "Medio de Difusion"
	end
end
