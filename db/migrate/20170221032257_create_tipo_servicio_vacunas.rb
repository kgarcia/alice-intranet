class CreateTipoServicioVacunas < ActiveRecord::Migration[5.0]
  def change
    create_table :tipo_servicio_vacunas do |t|
      t.references :vacuna, foreign_key: true
      t.references :tipo_servicio, foreign_key: true

      t.timestamps
    end
  end
end
