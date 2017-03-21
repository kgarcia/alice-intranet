class TipoCirugia < ApplicationRecord
	has_many :cirugias, dependent: :destroy
  def self.titulo
	  return "Tipo de Cirugía"
  end
end
