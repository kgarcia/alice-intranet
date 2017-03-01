class CreatePatologiaPersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :patologia_personas do |t|
      t.references :persona, foreign_key: true
      t.references :patologia, foreign_key: true

      t.timestamps
    end
  end
end
