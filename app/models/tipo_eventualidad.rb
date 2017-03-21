class TipoEventualidad < ApplicationRecord
  has_many :eventualidades, dependent: :destroy
  def self.titulo
	  return "Tipo de Eventualidad"
  end
end
