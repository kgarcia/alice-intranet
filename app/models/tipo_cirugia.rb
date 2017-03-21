class TipoCirugia < ApplicationRecord
	has_many :cirugias
  def self.titulo
	  return "Tipo de Cirugía"
  end
end
