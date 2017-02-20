class Adiccion < ApplicationRecord
  belongs_to :tipo_adiccion
  has_many :adiccion_tipo_servicios
  has_many :tipo_servicios, through: :adiccion_tipo_servicios

  def tipo
  	return self.tipoAdiccion
  end
end
