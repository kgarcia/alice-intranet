class Profesion < ApplicationRecord
  has_many :profesion_perfiles, dependent: :destroy
  has_many :perfiles, through: :profesion_perfiles, dependent: :destroy
  has_many :persona_profesiones, dependent: :destroy
  has_many :personas, through: :persona_profesiones, dependent: :destroy
  
  def self.titulo
	  return "Profesión"
  end

  def self.contarCitas
    @citas = Profesion.joins(personas: :citas).group("profesiones.descripcion").count
    return @citas
  end

end
