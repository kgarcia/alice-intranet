class CreatePersonaProfesiones < ActiveRecord::Migration[5.0]
  def change
    create_table :persona_profesiones do |t|
      t.references :persona, foreign_key: true
      t.references :profesion, foreign_key: true

      t.timestamps
    end
  end
end
