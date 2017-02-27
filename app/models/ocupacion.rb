class Ocupacion < ApplicationRecord
  has_many :ocupacion_tipo_servicios
  has_many :tipo_servicios, through: :ocupacion_tipo_servicios
  def self.titulo
	  return "Ocupaciones"
  end
end
