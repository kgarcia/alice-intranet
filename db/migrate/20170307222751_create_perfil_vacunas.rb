class CreatePerfilVacunas < ActiveRecord::Migration[5.0]
  def change
    create_table :perfil_vacunas do |t|
      t.references :vacuna, foreign_key: true
      t.references :perfil, foreign_key: true

      t.timestamps
    end
  end
end
