class CreateHisCitas < ActiveRecord::Migration[5.0]
  def change
    create_table :his_citas do |t|
      t.integer :turno
      t.integer :persona
      t.integer :usuario
      t.timestamp :fecha
      t.integer :tipo_pago
      t.integer :eventualidad
      t.integer :cita
      t.integer :estatus

      t.timestamps
    end
  end
end
