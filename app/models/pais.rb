class Pais < ApplicationRecord
	has_many :estado

  def self.titulo
	  return "Paises"
  end
end
