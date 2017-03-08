class CreateOcupacionPersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :ocupacion_personas do |t|
      t.references :persona, foreign_key: true
      t.references :ocupacion, foreign_key: true

      t.timestamps
    end
  end
end
