class CreateResponsables < ActiveRecord::Migration[5.0]
  def change
    create_table :responsables do |t|
      t.integer :estatus
      t.references :personas, foreign_key: true 
      t.references :servicios, foreign_key: true 

      t.timestamps
    end
  end
end
