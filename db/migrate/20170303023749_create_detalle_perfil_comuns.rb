class CreateDetallePerfilComuns < ActiveRecord::Migration[5.0]
  def change
    create_table :detalle_perfil_comuns do |t|
      t.belongs_to :perfil_comuns, foreign_key: true

      t.timestamps
    end
  end
end
