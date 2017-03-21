class Lesion < ApplicationRecord
  belongs_to :tipo_lesion
  has_many :lesion_perfiles, dependent: :destroy
  has_many :perfiles, through: :lesion_perfiles, dependent: :destroy
  has_many :lesion_personas, dependent: :destroy
  has_many :personas, through: :lesion_personas, dependent: :destroy

  def tipo
  	return self.tipo_lesion
  end
  def self.titulo
	  return "Lesión"
  end
end
