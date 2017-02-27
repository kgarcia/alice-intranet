class Rol < ApplicationRecord
	has_many :users
	has_many :option_roles
	has_many :option_menu, through: :option_roles
	after_create :save_option_menus
attr_reader :option_menus

  def option_menus=(value)
  	@option_menus = value
  end

  private
  def save_option_menus
  if !@option_menus.nil?  
  	@option_menus.each do |option_menu_id|
  		OptionRol.create(option_menu_id: option_menu_id, rol_id: self.id )
  	end
  end
  		
  end
end
