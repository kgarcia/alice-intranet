class Dia < ApplicationRecord
has_many :turnos

  def self.titulo
	  return "Dias"
  end
end
