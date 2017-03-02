class CreateLesionPersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :lesion_personas do |t|
      t.references :persona, foreign_key: true
      t.references :lesion, foreign_key: true

      t.timestamps
    end
  end
end
