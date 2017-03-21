class Vacuna < ApplicationRecord
  has_many :vacuna_perfiles, dependent: :destroy
  has_many :perfiles, through: :vacuna_perfiles, dependent: :destroy
  has_many :vacuna_personas, dependent: :destroy
  has_many :personas, through: :vacuna_personas, dependent: :destroy

  def self.titulo
	  return "Vacuna"
  end
end
