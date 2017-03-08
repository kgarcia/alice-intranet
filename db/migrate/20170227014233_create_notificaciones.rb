class CreateNotificaciones < ActiveRecord::Migration[5.0]
  def change
    create_table :notificaciones do |t|
      t.string :descripcion
      t.string :mensaje
      t.string :url
      t.integer :estatus
      t.references :tipo_notificacion, foreign_key: true

      t.timestamps
    end
  end
end
