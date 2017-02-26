class CreateUbicaciones < ActiveRecord::Migration[5.0]
  def change
    create_table :ubicaciones do |t|
      t.string :descripcion
      t.integer :estatus
      t.references :sector, foreign_key: true
      t.references :ciudad, foreign_key: true
      t.references :tipo_ubicacion, foreign_key: true

      t.timestamps
    end
  end
end
