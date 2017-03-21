class CreateHorarios < ActiveRecord::Migration[5.0]
  def change
    create_table :horarios do |t|
      t.integer :tiempo_cita
      t.integer :estatus, :null => false, :default => 1
      t.references :tipo_horario, foreign_key: true, :null => false, on_delete: :cascade
      t.references :servicio, foreign_key: true, on_delete: :cascade
      t.timestamps
    end
  end
end
