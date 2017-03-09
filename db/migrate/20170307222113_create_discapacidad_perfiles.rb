class CreateDiscapacidadPerfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :discapacidad_perfiles do |t|
      t.references :discapacidad, foreign_key: true
      t.references :perfil, foreign_key: true

      t.timestamps
    end
  end
end
