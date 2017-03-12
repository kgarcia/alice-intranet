class Profesion < ApplicationRecord
  has_many :profesion_perfiles
  has_many :perfiles, through: :profesion_perfiles
  has_many :persona_profesiones
  has_many :profesiones, through: :persona_profesiones
  
  def self.titulo
	  return "Profesión"
  end
end
