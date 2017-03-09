class CreateServicios < ActiveRecord::Migration[5.0]
  def change
    create_table :servicios do |t|
      t.text :descripcion
      t.references :ubicacion, foreign_key: true
      t.references :tipo_servicio, foreign_key: true, :null => false
      t.references :especialista, foreign_key: true, :null => true
      t.integer :estatus, :null => false, :default => 1
      t.attachment :foto
      t.float :precio

      t.timestamps
    end
  end
end
