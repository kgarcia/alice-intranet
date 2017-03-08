class CreateEventos < ActiveRecord::Migration[5.0]
  def change
    create_table :eventos do |t|
      t.string :descripcion, :null => false
      t.integer :estatus, :null => false, :default => 1
      t.references :tipo_evento, foreign_key: true, :null => false
      t.attachment :foto
      t.timestamps
    end
  end
end
