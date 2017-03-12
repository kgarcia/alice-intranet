class Patologia < ApplicationRecord
  belongs_to :tipo_patologia
  has_many :patologia_perfiles
  has_many :perfiles, through: :patologia_perfiles
  has_many :patologia_personas
  has_many :personas, through: :patologia_personas

  def tipo
  	return self.tipo_patologia
  end
  def self.titulo
	  return "Patología"
  end
end
