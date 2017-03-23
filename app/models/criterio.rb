class Criterio < ApplicationRecord
  belongs_to :tipo_criterio
  has_many :criterio_tipo_servicios, dependent: :destroy
  has_many :tipo_servicios, through: :criterio_tipo_servicios, dependent: :destroy

  def tipo
  	return self.tipo_criterio
  end

  def self.titulo
	  return "Criterio"
  end

  def self.criteriosPorServicio(servicio)
    @criterios = Criterio.joins( tipo_servicios: :servicios )
    if servicio != nil
      @criterios = @criterios.where("servicios.id" => servicio)
    end
    return @criterios
  end
end
