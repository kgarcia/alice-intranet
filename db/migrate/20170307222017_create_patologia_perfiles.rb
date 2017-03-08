class CreatePatologiaPerfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :patologia_perfiles do |t|
      t.references :patologia, foreign_key: true
      t.references :perfil, foreign_key: true

      t.timestamps
    end
  end
end
