class Vacuna < ApplicationRecord
  has_many :vacuna_perfiles, dependent: :destroy
  has_many :perfiles, through: :vacuna_perfiles, dependent: :destroy
  has_many :persona_vacunas, dependent: :destroy
  has_many :personas, through: :persona_vacunas, dependent: :destroy

  def self.titulo
	  return "Vacuna"
  end
end
