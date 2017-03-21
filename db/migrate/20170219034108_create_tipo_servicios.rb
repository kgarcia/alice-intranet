class CreateTipoServicios < ActiveRecord::Migration[5.0]
  def change
    create_table :tipo_servicios do |t|
      t.string :descripcion
      t.text :texto 
      t.attachment :foto
      t.integer :estatus, :null => false, :default => 1
      t.references :categoria, foreign_key: true, :null => false, on_delete: :cascade
      t.references :especialidad, foreign_key: true, :null => false, on_delete: :cascade
      t.references :tipo_atencion, foreign_key: true, :null => true, on_delete: :cascade
      t.timestamps
    end
  end
end
