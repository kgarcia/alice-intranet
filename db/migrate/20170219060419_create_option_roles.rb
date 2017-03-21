class CreateOptionRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :option_roles do |t|
      t.references :option_menu, foreign_key: true, :null => false, on_delete: :cascade
      t.references :rol, foreign_key: true, :null => false, on_delete: :cascade

      t.timestamps
    end
  end
end
