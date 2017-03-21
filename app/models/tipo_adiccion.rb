class TipoAdiccion < ApplicationRecord
	has_many :adicciones
  def self.titulo
	  return "Tipo de Adicción"
  end
end
