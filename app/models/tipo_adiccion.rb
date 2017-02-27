class TipoAdiccion < ApplicationRecord
	has_many :adicciones
  def self.titulo
	  return "Tipos de Adiccion"
  end
end
