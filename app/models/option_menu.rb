class OptionMenu < ActiveRecord::Base
	has_many :option_roles, dependent: :destroy
	has_many :roles, through: :option_roles, dependent: :destroy
  def self.titulo
	  return "Opciones de Menu"
  end
end
