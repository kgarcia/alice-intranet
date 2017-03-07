class CreateRangoEdadPerfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :rango_edad_perfiles do |t|
      t.references :rango_edad, foreign_key: true
      t.references :perfil, foreign_key: true

      t.timestamps
    end
  end
end
