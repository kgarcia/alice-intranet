class CreateGrupoSanguineoPerfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :grupo_sanguineo_perfiles do |t|
      t.references :grupo_sanguineo, foreign_key: true
      t.references :perfil, foreign_key: true

      t.timestamps
    end
  end
end
