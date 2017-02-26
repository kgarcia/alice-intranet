class Habito < ApplicationRecord
  belongs_to :tipo_habito
  has_many :habito_tipo_servicios
  has_many :tipo_servicios, through: :habito_tipo_servicios

  def tipo
  	return self.tipo_habito
  end
end
