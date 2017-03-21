class CreateOptionRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :option_roles do |t|
      t.references :option_menu, foreign_key: true, :null => false
      t.references :rol, foreign_key: true, :null => false

      t.timestamps
    end
  end
end
