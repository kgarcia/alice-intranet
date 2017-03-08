class CreatePaises < ActiveRecord::Migration[5.0]
  def change
    create_table :paises do |t|
      t.string :descripcion, :null => false
      t.string :codigo, :null => true
      t.integer :estatus, :null => false, :default => 1

      t.timestamps
    end
  end
end
