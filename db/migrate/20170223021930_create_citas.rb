class CreateCitas < ActiveRecord::Migration[5.0]
  def change
    create_table :citas do |t|
      t.references :turno, foreign_key: true
      t.references :persona, foreign_key: true
      t.references :usuario, foreign_key: true
      t.timestamp :fecha
      t.references :tipo_pago, foreign_key: true
      t.references :tipo_cita, foreign_key: true
      t.integer :estatus

      t.timestamps
    end
  end
end
