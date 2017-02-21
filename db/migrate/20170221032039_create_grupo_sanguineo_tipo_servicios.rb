class CreateGrupoSanguineoTipoServicios < ActiveRecord::Migration[5.0]
  def change
    create_table :grupo_sanguineo_tipo_servicios do |t|
      t.references :grupo_sanguineo, foreign_key: true
      t.references :tipo_servicio, foreign_key: true

      t.timestamps
    end
  end
end
