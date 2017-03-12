class Ocupacion < ApplicationRecord
  has_many :ocupacion_perfiles
  has_many :perfiles, through: :ocupacion_perfiles
  has_many :ocupacion_personas
  has_many :personas, through: :ocupacion_personas

  def self.titulo
	  return "Ocupación"
  end
end
