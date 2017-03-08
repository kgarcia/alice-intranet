class OptionRol < ApplicationRecord
  belongs_to :option_menu
  belongs_to :rol

  def self.titulo
	  return "Opciones"
  end
end
