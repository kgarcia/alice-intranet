class Patologia < ApplicationRecord
  belongs_to :tipo_patologia
  has_many :patologia_perfiles, dependent: :destroy
  has_many :perfiles, through: :patologia_perfiles, dependent: :destroy
  has_many :patologia_personas, dependent: :destroy
  has_many :personas, through: :patologia_personas, dependent: :destroy

  def tipo
  	return self.tipo_patologia
  end
  def self.titulo
	  return "Patología"
  end

  def self.contarCitas
    @citas = Patologia.joins(personas: :citas).group("patologias.descripcion").count
    return @citas
  end
end
