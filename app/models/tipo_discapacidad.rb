class TipoDiscapacidad < ApplicationRecord
	has_many :discapacidades
  def self.titulo
	  return "Tipos de Discapacidad"
  end
end
