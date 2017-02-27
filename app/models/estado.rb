class Estado < ApplicationRecord
  belongs_to :pais
  has_many :ciudad

  def tipo
  	return self.pais
  end

end
