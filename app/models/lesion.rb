class Lesion < ApplicationRecord
  belongs_to :tipo_lesion
  has_many :lesion_tipo_servicios
  has_many :tipo_servicios, through: :lesion_tipo_servicios

  def tipo
  	return self.tipo_lesion
  end
  def self.titulo
	  return "Lesiones"
  end
end
