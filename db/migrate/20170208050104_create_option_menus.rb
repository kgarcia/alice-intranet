class CreateOptionMenus < ActiveRecord::Migration
  def change
    create_table :option_menus do |t|
      t.integer :id_padre, :null => true
      t.string :nombre, :null => false
      t.string :url_path, :null => true
      t.string :icono, :null => true 
      t.string :controlador, :null => true
      t.string :accion, :null => true
      t.integer :num_hijos, :null => true
      t.integer :estatus, :null => false, :default => 1

      t.timestamps
    end
  end
end
