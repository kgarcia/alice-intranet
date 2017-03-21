class CreateCiudades < ActiveRecord::Migration[5.0]
  def change
    create_table :ciudades do |t|
      t.string :descripcion, :null => false
      t.integer :estatus, :null => false, :default => 1
      t.references :estado, foreign_key: true, :null => false, on_delete: :cascade

      t.timestamps
    end
  end
end
