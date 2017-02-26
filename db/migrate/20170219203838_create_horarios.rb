class CreateHorarios < ActiveRecord::Migration[5.0]
  def change
    create_table :horarios do |t|
      t.string :descripcion
      t.integer :tiempo_cita
      t.integer :estatus
      t.references :tipo_horario, foreign_key: true

      t.timestamps
    end
  end
end
