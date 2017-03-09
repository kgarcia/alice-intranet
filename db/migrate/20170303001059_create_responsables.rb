class CreateResponsables < ActiveRecord::Migration[5.0]
  def change
    create_table :responsables do |t|
      t.references :personas, foreign_key: true, :null => false
      t.references :servicios, foreign_key: true, :null => false
      t.integer :estatus, :null => false, :default => 1

      t.timestamps
    end
  end
end
