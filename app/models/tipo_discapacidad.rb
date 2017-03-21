class TipoDiscapacidad < ApplicationRecord
	has_many :discapacidades, dependent: :destroy
  def self.titulo
	  return "Tipo de Discapacidad"
  end
end
