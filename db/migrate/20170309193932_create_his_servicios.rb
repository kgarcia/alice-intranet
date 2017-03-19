class CreateHisServicios < ActiveRecord::Migration[5.0]
  def change
    create_table :his_servicios do |t|
      t.text :descripcion
      t.integer :ubicacion
      t.integer :tipo_servicio
      t.integer :especialista
      t.integer :estatus
      t.attachment :foto
      t.float :precio

      t.timestamps
    end
  end
end
