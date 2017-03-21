class Cirugia < ApplicationRecord
  belongs_to :tipo_cirugia
  has_many :cirugia_perfiles, dependent: :destroy
  has_many :perfiles, through: :cirugia_perfiles, dependent: :destroy
  has_many :cirugia_personas, dependent: :destroy
  has_many :personas, through: :cirugia_personas, dependent: :destroy  

  def tipo
  	return self.tipo_cirugia
  end
  def self.titulo
		return "Cirugía"
	end
end
