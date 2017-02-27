class Persona < ApplicationRecord
  belongs_to :sexo
  has_one :usuario
  has_one :especialista
  def self.titulo
	  return "Personas"
  end
end
