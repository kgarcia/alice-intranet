class Discapacidad < ApplicationRecord
  belongs_to :tipo_discapacidad
  has_many :discapacidad_perfiles
  has_many :perfiles, through: :discapacidad_perfiles
  has_many :discapacidad_personas
  has_many :personas, through: :discapacidad_personas

  def tipo
  	return self.tipo_discapacidad
  end

  def self.titulo
	  return "Discapacidad"
  end

end
