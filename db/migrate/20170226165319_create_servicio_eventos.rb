class CreateServicioEventos < ActiveRecord::Migration[5.0]
  def change
    create_table :tipo_servicio_eventos do |t|
      t.integer :estatus, :null => false, :default => 1
      t.references :tipo_servicio, foreign_key: true, :null => false, on_delete: :cascade
      t.references :evento, foreign_key: true, :null => false, on_delete: :cascade

      t.timestamps
    end
  end
end
