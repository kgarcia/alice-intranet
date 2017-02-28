class CreateUniversidades < ActiveRecord::Migration[5.0]
  def change
    create_table :universidades do |t|
      t.string :descripcion
      t.integer :estatus

      t.timestamps
    end
  end
end
