class CreateEventos < ActiveRecord::Migration[5.0]
  def change
    create_table :eventos do |t|
      t.string :descripcion
      t.integer :estatus
      t.references :tipo_evento, foreign_key: true
      t.attachment :foto
      t.timestamps
    end
  end
end
