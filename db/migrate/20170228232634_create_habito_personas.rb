class CreateHabitoPersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :habito_personas do |t|
      t.references :persona, foreign_key: true
      t.references :habito, foreign_key: true

      t.timestamps
    end
  end
end
