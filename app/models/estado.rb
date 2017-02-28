class Estado < ApplicationRecord
  belongs_to :pais
  def tipo
  	return self.pais
  end
end
