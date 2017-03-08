class CreateSexoTipoServicios < ActiveRecord::Migration[5.0]
  def change
    create_table :sexo_tipo_servicios do |t|
      t.references :sexo, foreign_key: true, :null => false
      t.references :tipo_servicio, foreign_key: true, :null => false
      t.integer :estatus, :null => false, :default => 1

      t.timestamps
    end
  end
end
