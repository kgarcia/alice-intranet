class CreatePerfilComuns < ActiveRecord::Migration[5.0]
  def change
    create_table :perfil_comuns do |t|
      t.string :descripcion
      t.integer :estatus
      t.belongs_to :persona, index: true

      t.timestamps
    end
  end
end
