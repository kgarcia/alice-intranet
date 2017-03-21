class OptionMenu < ActiveRecord::Base
	has_many :option_roles
	has_many :roles, through: :option_roles
  def self.titulo
	  return "Opciones de Menu"
  end
end
