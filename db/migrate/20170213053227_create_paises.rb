class CreatePaises < ActiveRecord::Migration[5.0]
  def change
    create_table :paises do |t|
      t.string :descripcion
      t.string :codigo
      t.integer :estatus

      t.timestamps
    end
  end
end
