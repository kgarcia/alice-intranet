class CreateAdiccionPersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :adiccion_personas do |t|
      t.references :persona, foreign_key: true, :null => false, on_delete: :cascade
      t.references :adiccion, foreign_key: true, :null => false, on_delete: :cascade
      t.integer :estatus, :null => false, :default => 1

      t.timestamps
    end
  end
end
