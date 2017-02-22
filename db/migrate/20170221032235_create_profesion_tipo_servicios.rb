class CreateProfesionTipoServicios < ActiveRecord::Migration[5.0]
  def change
    create_table :profesion_tipo_servicios do |t|
      t.references :profesion, foreign_key: true
      t.references :tipo_servicio, foreign_key: true

      t.timestamps
    end
  end
end
