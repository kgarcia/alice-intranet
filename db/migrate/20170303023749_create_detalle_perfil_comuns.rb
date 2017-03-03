class CreateDetallePerfilComuns < ActiveRecord::Migration[5.0]
  def change
    create_table :detalle_perfil_comuns do |t|
      t.references :perfil_comuns, foreign_key: true

      t.timestamps
    end
  end
end
