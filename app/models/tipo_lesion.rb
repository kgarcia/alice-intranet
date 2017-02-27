class TipoLesion < ApplicationRecord
	has_many :lesiones
  def self.titulo
	  return "Tipos de Lesion"
  end
end
