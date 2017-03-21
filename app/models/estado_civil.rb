class EstadoCivil < ApplicationRecord
  has_many :estado_civil_perfiles, dependent: :destroy
  has_many :perfiles, through: :estado_civil_perfiles, dependent: :destroy
  has_many :personas, dependent: :destroy

  def self.titulo
	  return "Estado Civil"
  end

end
