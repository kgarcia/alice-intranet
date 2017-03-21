class TipoMotivo < ApplicationRecord
  has_many :motivos
  def self.titulo
	  return "Tipo de Motivo"
  end
end
