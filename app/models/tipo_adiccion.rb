class TipoAdiccion < ApplicationRecord
	has_many :adicciones, dependent: :destroy
  def self.titulo
	  return "Tipo de Adicción"
  end
end
