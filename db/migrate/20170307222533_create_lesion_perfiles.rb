class CreateLesionPerfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :lesion_perfiles do |t|
      t.references :lesion, foreign_key: true
      t.references :perfil, foreign_key: true

      t.timestamps
    end
  end
end
