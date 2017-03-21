class CreatePersonaProfesiones < ActiveRecord::Migration[5.0]
  def change
    create_table :persona_profesiones do |t|
      t.references :persona, foreign_key: true, :null => false, on_delete: :cascade
      t.references :profesion, foreign_key: true, :null => false, on_delete: :cascade
      t.integer :estatus, :null => false, :default => 1

      t.timestamps
    end
  end
end
