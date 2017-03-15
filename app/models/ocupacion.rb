class Ocupacion < ApplicationRecord
  has_many :ocupacion_perfiles
  has_many :perfiles, through: :ocupacion_perfiles
  has_many :ocupacion_personas
  has_many :personas, through: :ocupacion_personas

  def self.titulo
	  return "Ocupación"
  end

  def self.contarCitas
    @citas = Ocupacion.joins(personas: :citas).group("ocupaciones.descripcion").count
    return @citas
  end

end
