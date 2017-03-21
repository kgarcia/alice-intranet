class CreateBusquedas < ActiveRecord::Migration[5.0]
  def change
    create_table :busquedas do |t|
      t.string :descripcion
      t.integer :estatus, :null => false, :default => 1
      t.references :tipo_busqueda, foreign_key: true, :null => false, on_delete: :cascade
      t.references :especialidad, foreign_key: true, :null => true, on_delete: :cascade
      t.references :especialista, foreign_key: true, :null => true, on_delete: :cascade
      t.references :tipo_servicio, foreign_key: true, :null => true, on_delete: :cascade

      t.timestamps
    end
  end
end
