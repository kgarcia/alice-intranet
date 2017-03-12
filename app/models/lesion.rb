class Lesion < ApplicationRecord
  belongs_to :tipo_lesion
  has_many :lesion_perfiles
  has_many :perfiles, through: :lesion_perfiles
  has_many :lesion_personas
  has_many :personas, through: :lesion_personas

  def tipo
  	return self.tipo_lesion
  end
  def self.titulo
	  return "Lesión"
  end
end
