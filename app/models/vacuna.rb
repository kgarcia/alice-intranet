class Vacuna < ApplicationRecord
  has_many :vacuna_tipo_servicios
  has_many :tipo_servicios, through: :vacuna_tipo_servicios
  def self.titulo
	  return "Vacunas"
  end
end
