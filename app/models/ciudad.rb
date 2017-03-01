class Ciudad < ApplicationRecord
  belongs_to :estado

  def tipo
  	return self.estado
  end


  def self.titulo
	 return "Ciudades"
  end
end
