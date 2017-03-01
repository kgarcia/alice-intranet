class CreateAdiccionPersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :adiccion_personas do |t|
      t.references :persona, foreign_key: true
      t.references :adiccion, foreign_key: true

      t.timestamps
    end
  end
end
