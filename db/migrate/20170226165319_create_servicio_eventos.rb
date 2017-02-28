class CreateServicioEventos < ActiveRecord::Migration[5.0]
  def change
    create_table :servicio_eventos do |t|
      t.string :descripcion
      t.integer :estatus
      t.references :servicio, foreign_key: true
      t.references :evento, foreign_key: true

      t.timestamps
    end
  end
end
