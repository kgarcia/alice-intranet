class Discapacidad < ApplicationRecord
  belongs_to :tipo_discapacidad
  has_many :discapacidad_tipo_servicios
  has_many :tipo_servicios, through: :discapacidad_tipo_servicios

  def tipo
  	return self.tipo_discapacidad
  end

  def self.titulo
	  return "Discapacidades"
  end

end
