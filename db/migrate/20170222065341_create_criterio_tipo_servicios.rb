class CreateCriterioTipoServicios < ActiveRecord::Migration[5.0]
  def change
    create_table :criterio_tipo_servicios do |t|
      t.references :criterio, foreign_key: true, :null => false, on_delete: :cascade
      t.references :tipo_servicio, foreign_key: true, :null => false, on_delete: :cascade
      t.integer :estatus, :null => false, :default => 1

      t.timestamps
    end
  end
end
