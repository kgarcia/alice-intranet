class TipoPatologia < ApplicationRecord
	has_many :patologias, dependent: :destroy
  def self.titulo
	  return "Tipo de Patología"
  end
end
