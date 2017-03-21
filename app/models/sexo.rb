class Sexo < ApplicationRecord
  has_many :sexo_perfiles, dependent: :destroy
  has_many :perfiles, through: :sexo_perfiles, dependent: :destroy
  has_many :personas, dependent: :destroy
  
  def self.titulo
	  return "Sexo"
  end

  def self.contarCitas
    @citas = Sexo.joins(personas: :citas).group("sexos.descripcion").count
    return @citas
  end
end
