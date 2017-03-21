class CreateHisTipoServicios < ActiveRecord::Migration[5.0]
  def change
    create_table :his_tipo_servicios do |t|
      t.string :descripcion
      t.text :texto
      t.attachment :foto
      t.integer :estatus
      t.integer :categoria
      t.integer :especialidad
      t.integer :tipo_atencion

      t.timestamps
    end
  end
end
