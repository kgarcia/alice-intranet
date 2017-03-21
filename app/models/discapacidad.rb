class Discapacidad < ApplicationRecord
  belongs_to :tipo_discapacidad
  has_many :discapacidad_perfiles, dependent: :destroy
  has_many :perfiles, through: :discapacidad_perfiles, dependent: :destroy
  has_many :discapacidad_personas, dependent: :destroy
  has_many :personas, through: :discapacidad_personas, dependent: :destroy

  def tipo
  	return self.tipo_discapacidad
  end

  def self.titulo
	  return "Discapacidad"
  end

end
