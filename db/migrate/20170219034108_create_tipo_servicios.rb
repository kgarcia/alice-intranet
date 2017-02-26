class CreateTipoServicios < ActiveRecord::Migration[5.0]
  def change
    create_table :tipo_servicios do |t|
      t.string :descripcion
      t.text :texto
      t.attachment :foto
      t.integer :estatus
      t.references :categoria, foreign_key: true
      t.references :especialidad, foreign_key: true
      t.references :tipo_atencion, foreign_key: true
      t.timestamps
    end
  end
end
