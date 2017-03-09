class CreateSexoPerfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :sexo_perfiles do |t|
      t.references :sexo, foreign_key: true
      t.references :perfil, foreign_key: true

      t.timestamps
    end
  end
end
