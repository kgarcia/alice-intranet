class Habito < ApplicationRecord
  belongs_to :tipo_habito
  has_many :habito_perfiles
  has_many :perfiles, through: :habito_perfiles
  has_many :habito_personas
  has_many :personas, through: :habito_personas

  def tipo
  	return self.tipo_habito
  end
  def self.titulo
	  return "Hábito"
  end
end
