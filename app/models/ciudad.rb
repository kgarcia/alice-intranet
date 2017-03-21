class Ciudad < ApplicationRecord
  belongs_to :estado
  has_many :ubicacion, dependent: :destroy

  def tipo
  	return self.estado
  end


  def self.titulo
	 return "Ciudad"
  end
end
