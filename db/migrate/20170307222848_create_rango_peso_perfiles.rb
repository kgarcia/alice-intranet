class CreateRangoPesoPerfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :rango_peso_perfiles do |t|
      t.references :rango_peso, foreign_key: true
      t.references :perfil, foreign_key: true

      t.timestamps
    end
  end
end
