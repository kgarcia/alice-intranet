class Dia < ApplicationRecord
has_many :turnos, dependent: :destroy

  def self.titulo
	  return "Día"
  end

  def self.contarCitas
    @citas = Dia.joins(turnos: :citas).group("dias.descripcion").count
    return @citas
  end

end
