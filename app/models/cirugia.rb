class Cirugia < ApplicationRecord
  belongs_to :tipo_cirugia
  has_many :cirugia_perfiles
  has_many :perfiles, through: :cirugia_perfiles
  has_many :cirugia_personas
  has_many :personas, through: :cirugia_personas  

  def tipo
  	return self.tipo_cirugia
  end
  def self.titulo
		return "Cirugía"
	end
end
