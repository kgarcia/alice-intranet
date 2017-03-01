class CreateRangoEdadTipoServicios < ActiveRecord::Migration[5.0]
  def change
    create_table :rango_edad_tipo_servicios do |t|
      t.references :rango_edad, foreign_key: true
      t.references :tipo_servicio, foreign_key: true

      t.timestamps
    end
  end
end
