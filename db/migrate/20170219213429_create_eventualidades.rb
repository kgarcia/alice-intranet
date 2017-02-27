class CreateEventualidades < ActiveRecord::Migration[5.0]
  def change
    create_table :eventualidades do |t|
      t.string :descripcion
      t.integer :estatus
      t.references :tipo_eventualidad, foreign_key: true
      t.references :motivo, foreign_key: true
      t.datetime :fecha_inicio
      t.datetime :fecha_fin

      t.timestamps
    end
  end
end
