class Patologia < ApplicationRecord
  belongs_to :tipo_patologia
  has_many :patologia_tipo_servicios
  has_many :tipo_servicios, through: :patologia_tipo_servicios

  def tipo
  	return self.tipo_patologia
  end
  def self.titulo
	  return "Patología"
  end
end
