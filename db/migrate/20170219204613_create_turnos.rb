class CreateTurnos < ActiveRecord::Migration[5.0]
  def change
    create_table :turnos do |t|
      t.string :descripcion
      t.time :hora_inicio
      t.time :hora_fin
      t.integer :estatus
      t.references :dia, foreign_key: true
      t.references :horario, foreign_key: true

      t.timestamps
    end
  end
end
