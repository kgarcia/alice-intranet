class CreateLesionTipoServicios < ActiveRecord::Migration[5.0]
  def change
    create_table :lesion_tipo_servicios do |t|
      t.references :lesion, foreign_key: true, :null => false
      t.references :tipo_servicio, foreign_key: true, :null => false
      t.integer :estatus, :null => false, :default => 1

      t.timestamps
    end
  end
end
