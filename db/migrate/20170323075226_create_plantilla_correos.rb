class CreatePlantillaCorreos < ActiveRecord::Migration[5.0]
  def change
    create_table :plantilla_correos do |t|
      t.string :descripcion
      t.text :texto
      t.integer :estatus

      t.timestamps
    end
  end
end
