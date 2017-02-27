class Estado < ApplicationRecord
  belongs_to :pais

  def tipo
  	return self.pais
  end

  def self.titulo
	  return "Estados"
  end

end
