class EstadoCivil < ApplicationRecord
  has_many :estado_civil_perfiles
  has_many :perfiles, through: :estado_civil_perfiles

  def self.titulo
	  return "Estado Civil"
  end

end
