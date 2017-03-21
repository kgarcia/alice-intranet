class TipoLesion < ApplicationRecord
	has_many :lesiones
  def self.titulo
	  return "Tipo de Lesión"
  end
end
