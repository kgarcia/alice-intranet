class CreateCiudades < ActiveRecord::Migration[5.0]
  def change
    create_table :ciudades do |t|
      t.string :descripcion
      t.integer :estatus
      t.references :estado, foreign_key: true

      t.timestamps
    end
  end
end
