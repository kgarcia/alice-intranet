class CreateInformacionGenerals < ActiveRecord::Migration[5.0]
  def change
    create_table :informacion_generals do |t|
      t.string :nombre, :null => false
      t.string :rif, :null => false
      t.text :direccion, :null => false
      t.string :tlf
      t.string :tlf2
      t.string :email
      t.text :widgetFB
      t.text :widgetTW
      t.text :url_fb
      t.text :url_tw
      t.text :url_ins
      t.text :url_gp
      t.text :url_app
      t.string :slogan
      t.string :logo
      t.float :latitud
      t.float :longitud
      t.integer :estatus, :null => false, :default => 1

      t.timestamps
    end
  end
end
