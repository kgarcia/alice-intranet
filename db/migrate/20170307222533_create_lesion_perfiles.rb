class CreateLesionPerfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :lesion_perfiles do |t|
      t.references :lesion, foreign_key: true, on_delete: :cascade
      t.references :perfil, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
