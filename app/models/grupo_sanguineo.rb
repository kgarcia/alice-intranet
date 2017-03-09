class GrupoSanguineo < ApplicationRecord
  has_many :grupo_sanguineo_tipo_servicios
  has_many :tipo_servicios, through: :grupo_sanguineo_tipo_servicios
  def self.titulo
	  return "Grupo Sanguíneo"
  end
end
