class Dia < ApplicationRecord
has_many :turnos

  def self.titulo
	  return "Día"
  end
end
