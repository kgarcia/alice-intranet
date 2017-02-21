class Cirugia < ApplicationRecord
  belongs_to :tipo_cirugia
  has_many :cirugia_tipo_servicios
  has_many :tipo_servicios, through: :cirugia_tipo_servicios

  def tipo
  	return self.tipo_cirugia
  end
end
