class TipoLesion < ApplicationRecord
	has_many :lesiones, dependent: :destroy
  def self.titulo
	  return "Tipo de Lesión"
  end
end
