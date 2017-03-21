class CreateDiscapacidadPerfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :discapacidad_perfiles do |t|
      t.references :discapacidad, foreign_key: true, on_delete: :cascade
      t.references :perfil, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
