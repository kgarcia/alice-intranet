class Profesion < ApplicationRecord
  has_many :profesion_tipo_servicios
  has_many :tipo_servicios, through: :profesion_tipo_servicios
  def self.titulo
	  return "Profesión"
  end
end
