class TipoDiscapacidad < ApplicationRecord
	has_many :discapacidades
  def self.titulo
	  return "Tipo de Discapacidad"
  end
end
