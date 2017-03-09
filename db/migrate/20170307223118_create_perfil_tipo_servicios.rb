class CreatePerfilTipoServicios < ActiveRecord::Migration[5.0]
  def change
    create_table :perfil_tipo_servicios do |t|
      t.references :tipo_servicio, foreign_key: true
      t.references :perfil, foreign_key: true

      t.timestamps
    end
  end
end
