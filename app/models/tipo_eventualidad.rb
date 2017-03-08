class TipoEventualidad < ApplicationRecord
  has_many :eventualidades
  def self.titulo
	  return "Tipos de Eventualidad"
  end
end
