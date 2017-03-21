class Vacuna < ApplicationRecord
  has_many :vacuna_perfiles
  has_many :perfiles, through: :vacuna_perfiles
  has_many :vacuna_personas
  has_many :personas, through: :vacuna_personas

  def self.titulo
	  return "Vacuna"
  end
end
