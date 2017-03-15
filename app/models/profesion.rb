class Profesion < ApplicationRecord
  has_many :profesion_perfiles
  has_many :perfiles, through: :profesion_perfiles
  has_many :persona_profesiones
  has_many :personas, through: :persona_profesiones
  
  def self.titulo
	  return "Profesión"
  end

  def self.contarCitas
    @citas = Profesion.joins(personas: :citas).group("profesiones.descripcion").count
    return @citas
  end

end
