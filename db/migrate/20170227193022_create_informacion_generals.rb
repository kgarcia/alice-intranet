class CreateInformacionGenerals < ActiveRecord::Migration[5.0]
  def change
    create_table :informacion_generals do |t|
      t.string :nombre
      t.string :rif
      t.text :direccion
      t.string :tlf
      t.string :email
      t.text :widgetFB
      t.text :widgetTW
      t.string :slogan
      t.string :logo
      t.float :latitud
      t.float :longitud
      t.integer :estatus, :null => false, :default => 1

      t.timestamps
    end
  end
end
