class CreateTurnos < ActiveRecord::Migration[5.0]
  def change
    create_table :turnos do |t|
      t.time :hora_inicio
      t.time :hora_fin
      t.integer :estatus, :null => false, :default => 1
      t.integer :cantidad_pacientes, :null => true
      t.references :dia, foreign_key: true, on_delete: :cascade
      t.references :horario, foreign_key: true, on_delete: :cascade
      t.references :tipo_turno, foreign_key: true, :null => false, on_delete: :cascade
      t.timestamps
    end
  end
end
