class Estado < ApplicationRecord
  belongs_to :pais
  has_many :ciudad, dependent: :destroy

  def tipo
  	return self.pais
  end

  def self.titulo
	  return "Estado"
  end

end
