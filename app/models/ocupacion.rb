class Ocupacion < ApplicationRecord
  has_many :ocupacion_perfiles, dependent: :destroy
  has_many :perfiles, through: :ocupacion_perfiles, dependent: :destroy
  has_many :ocupacion_personas, dependent: :destroy
  has_many :personas, through: :ocupacion_personas, dependent: :destroy

  def self.titulo
	  return "Ocupación"
  end

  def self.contarCitas
    @citas = Ocupacion.joins(personas: :citas).group("ocupaciones.descripcion").count
    return @citas
  end

end
