class CreateServicios < ActiveRecord::Migration[5.0]
  def change
    create_table :servicios do |t|
      t.text :descripcion
      t.references :ubicacion, foreign_key: true
      t.references :tipo_servicio, foreign_key: true
      t.references :especialista, foreign_key: true
      t.integer :estatus
      t.attachment :foto
      t.float :precio
      t.references :usuario, foreign_key: true 
      t.timestamps
    end
  end
end
