class Criterio < ApplicationRecord
  belongs_to :tipo_criterio
  has_many :criterio_tipo_servicios
  has_many :tipo_servicios, through: :criterio_tipo_servicios
  
  def tipo
  	return self.tipo_criterio
  end

  def self.titulo
	  return "Criterios"
  end
end
