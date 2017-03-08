class CreateBusquedas < ActiveRecord::Migration[5.0]
  def change
    create_table :busquedas do |t|
      t.string :descripcion
      t.integer :estatus
      t.references :tipo_busqueda, foreign_key: true
      t.references :especialidad, foreign_key: true
      t.references :especialista, foreign_key: true
      t.references :tipo_servicio, foreign_key: true

      t.timestamps
    end
  end
end
