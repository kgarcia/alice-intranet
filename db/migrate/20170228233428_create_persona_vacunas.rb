class CreatePersonaVacunas < ActiveRecord::Migration[5.0]
  def change
    create_table :persona_vacunas do |t|
      t.references :persona, foreign_key: true
      t.references :vacuna, foreign_key: true

      t.timestamps
    end
  end
end
