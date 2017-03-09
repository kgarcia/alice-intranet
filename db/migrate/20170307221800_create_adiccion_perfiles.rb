class CreateAdiccionPerfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :adiccion_perfiles do |t|
      t.references :adiccion, foreign_key: true
      t.references :perfil, foreign_key: true

      t.timestamps
    end
  end
end
