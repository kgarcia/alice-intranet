class Adiccion < ApplicationRecord
<<<<<<< HEAD
  belongs_to :tipoAdiccion, foreign_key: "tipo_adicciones_id"

  def tipo
  	return self.tipoAdiccion
=======
  belongs_to :tipo_adiccion
  has_many :adiccion_tipo_servicios
  has_many :tipo_servicios, through: :adiccion_tipo_servicios

  def tipo
  	return self.tipo_adiccion
>>>>>>> 46d78a09a6d73b42ea989e8ff32ab2bd3293e157
  end
end
