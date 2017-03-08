class CreateEstadoCivilPerfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :estado_civil_perfiles do |t|
      t.references :estado_civil, foreign_key: true
      t.references :perfil, foreign_key: true

      t.timestamps
    end
  end
end
