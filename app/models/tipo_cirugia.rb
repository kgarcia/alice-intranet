class TipoCirugia < ApplicationRecord
	has_many :cirugias
  def self.titulo
	  return "Tipos de Cirugia"
  end
end
