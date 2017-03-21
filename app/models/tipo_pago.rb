class TipoPago < ApplicationRecord
	has_many :citas
  def self.titulo
	  return "Tipo de Pago"
  end
end
