class CreateHabitoTipoServicios < ActiveRecord::Migration[5.0]
  def change
    create_table :habito_tipo_servicios do |t|
      t.references :habito, foreign_key: true
      t.references :tipo_servicio, foreign_key: true

      t.timestamps
    end
  end
end
