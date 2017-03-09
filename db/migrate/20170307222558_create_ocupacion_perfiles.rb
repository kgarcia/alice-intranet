class CreateOcupacionPerfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :ocupacion_perfiles do |t|
      t.references :ocupacion, foreign_key: true
      t.references :perfil, foreign_key: true

      t.timestamps
    end
  end
end
