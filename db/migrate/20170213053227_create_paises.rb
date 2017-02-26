class CreatePaises < ActiveRecord::Migration[5.0]
  def change
    create_table :paises do |t|
      t.string :descripcion
<<<<<<< HEAD
=======
      t.string :codigo
>>>>>>> 46d78a09a6d73b42ea989e8ff32ab2bd3293e157
      t.integer :estatus

      t.timestamps
    end
  end
end
