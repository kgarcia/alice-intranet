class CreateHabitoPerfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :habito_perfiles do |t|
      t.references :habito, foreign_key: true
      t.references :perfil, foreign_key: true

      t.timestamps
    end
  end
end
