class Estado < ApplicationRecord
  belongs_to :pais
  has_many :ciudad

  def tipo
  	return self.pais
  end

  def self.titulo
	  return "Estados"
  end

end
