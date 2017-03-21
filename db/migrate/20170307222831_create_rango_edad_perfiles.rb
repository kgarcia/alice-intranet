class CreateRangoEdadPerfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :rango_edad_perfiles do |t|
      t.references :rango_edad, foreign_key: true, on_delete: :cascade
      t.references :perfil, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
