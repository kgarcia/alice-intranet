class CreateOcupacionTipoServicios < ActiveRecord::Migration[5.0]
  def change
    create_table :ocupacion_tipo_servicios do |t|
      t.references :ocupacion, foreign_key: true, :null => false
      t.references :tipo_servicio, foreign_key: true, :null => false
      t.integer :estatus, :null => false, :default => 1

      t.timestamps
    end
  end
end
