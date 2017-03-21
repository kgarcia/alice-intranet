class CreateProfesionPerfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profesion_perfiles do |t|
      t.references :profesion, foreign_key: true
      t.references :perfil, foreign_key: true

      t.timestamps
    end
  end
end
