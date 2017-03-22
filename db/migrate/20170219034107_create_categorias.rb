class CreateCategorias < ActiveRecord::Migration[5.0]
  def change
    create_table :categorias do |t|
      t.string :descripcion, :null => false
      t.integer :estatus, :null => false, :default => 1
      t.attachment :foto
      t.timestamps
    end
  end
end
