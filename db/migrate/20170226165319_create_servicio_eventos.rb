class CreateServicioEventos < ActiveRecord::Migration[5.0]
  def change
    create_table :servicio_eventos do |t|
      t.string :descripcion
      t.integer :estatus, :null => false, :default => 1
      t.references :servicio, foreign_key: true, :null => false
      t.references :evento, foreign_key: true, :null => false

      t.timestamps
    end
  end
end
