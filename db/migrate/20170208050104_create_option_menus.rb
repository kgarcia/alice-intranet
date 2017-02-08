class CreateOptionMenus < ActiveRecord::Migration
  def change
    create_table :option_menus do |t|
      t.integer :id_padre
      t.string :nombre
      t.string :url_path
      t.string :icono
      t.string :controlador
      t.string :accion
      t.integer :num_hijos
      t.string :estatus

      t.timestamps null: false
    end
  end
end
