class CreateEstadoCivilTipoServicios < ActiveRecord::Migration[5.0]
  def change
    create_table :estado_civil_tipo_servicios do |t|
      t.references :estado_civil, foreign_key: true
      t.references :tipo_servicio, foreign_key: true

      t.timestamps
    end
  end
end
