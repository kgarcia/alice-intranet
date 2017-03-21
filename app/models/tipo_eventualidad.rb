class TipoEventualidad < ApplicationRecord
  has_many :eventualidades
  def self.titulo
	  return "Tipo de Eventualidad"
  end
end
