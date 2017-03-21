class Habito < ApplicationRecord
  belongs_to :tipo_habito
  has_many :habito_perfiles, dependent: :destroy
  has_many :perfiles, through: :habito_perfiles, dependent: :destroy
  has_many :habito_personas, dependent: :destroy
  has_many :personas, through: :habito_personas, dependent: :destroy

  def tipo
  	return self.tipo_habito
  end
  def self.titulo
	  return "Hábito"
  end
end
