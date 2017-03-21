class CreateNotificaciones < ActiveRecord::Migration[5.0]
  def change
    create_table :notificaciones do |t|
      t.string :descripcion, :null => false
      t.integer :estatus, :null => false, :default => 1
      t.references :tipo_notificacion, foreign_key: true, :null => false, on_delete: :cascade
      t.string :mensaje
      t.string :url
      t.integer :entidad_id

      t.timestamps
    end
  end
end
