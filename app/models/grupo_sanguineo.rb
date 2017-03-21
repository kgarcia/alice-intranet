class GrupoSanguineo < ApplicationRecord
  has_many :grupo_sanguineo_perfiles, dependent: :destroy
  has_many :perfiles, through: :grupo_sanguineo_perfiles, dependent: :destroy
  has_many :personas, dependent: :destroy
  
  def self.titulo
	  return "Grupo Sanguíneo"
  end
end
