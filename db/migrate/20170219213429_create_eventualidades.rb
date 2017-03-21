class CreateEventualidades < ActiveRecord::Migration[5.0]
  def change
    create_table :eventualidades do |t|
      t.string :descripcion, :null => false
      t.integer :estatus, :null => false, :default => 1
      t.references :tipo_eventualidad, foreign_key: true, :null => false, on_delete: :cascade
      t.references :motivo, foreign_key: true, :null => true, on_delete: :cascade
      t.datetime :fecha_inicio, :null => false
      t.datetime :fecha_fin, :null => true

      t.timestamps
    end
  end
end
