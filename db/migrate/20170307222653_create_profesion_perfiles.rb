class CreateProfesionPerfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profesion_perfiles do |t|
      t.references :profesion, foreign_key: true, on_delete: :cascade
      t.references :perfil, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
