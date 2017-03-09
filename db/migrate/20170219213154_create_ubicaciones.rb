class CreateUbicaciones < ActiveRecord::Migration[5.0]
  def change
    create_table :ubicaciones do |t|
      t.string :descripcion, :null => false
      t.integer :estatus, :null => false, :default => 1
      t.references :sector, foreign_key: true, :null => true
      t.references :ciudad, foreign_key: true, :null => true
      t.references :tipo_ubicacion, foreign_key: true, :null => false

      t.timestamps
    end
  end
end
