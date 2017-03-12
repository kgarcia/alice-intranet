class Sexo < ApplicationRecord
  has_many :sexo_perfiles
  has_many :perfiles, through: :sexo_perfiles
  has_many :personas
  
  def self.titulo
	  return "Sexo"
  end
end
