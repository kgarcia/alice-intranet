class CreateGrupoSanguineoPerfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :grupo_sanguineo_perfiles do |t|
      t.references :grupo_sanguineo, foreign_key: true, on_delete: :cascade
      t.references :perfil, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
