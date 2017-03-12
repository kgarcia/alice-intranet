class GrupoSanguineo < ApplicationRecord
  has_many :grupo_sanguineo_perfiles
  has_many :perfiles, through: :grupo_sanguineo_perfiles
  has_many :personas
  
  def self.titulo
	  return "Grupo Sanguíneo"
  end
end
