class Ubicacion < ApplicationRecord
  belongs_to :sector
  belongs_to :ciudad
  belongs_to :tipo_ubicacion
  has_many :eventos, dependent: :destroy


  def self.titulo
	  return "Ubicación"
  end
end
