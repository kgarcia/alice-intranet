class Adiccion < ApplicationRecord
  belongs_to :tipoAdiccion, foreign_key: "tipo_adicciones_id"

  def tipo
  	return self.tipoAdiccion
  end
end
