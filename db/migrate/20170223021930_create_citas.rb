class CreateCitas < ActiveRecord::Migration[5.0]
  def change
    create_table :citas do |t|
      t.references :turno, foreign_key: true, :null => false, on_delete: :cascade
      t.references :persona, foreign_key: true, :null => false, on_delete: :cascade
      t.references :usuario, foreign_key: true, :null => true, on_delete: :cascade
      t.timestamp :fecha
      t.references :tipo_pago, foreign_key: true, :null => true, on_delete: :cascade
      t.references :eventualidad, foreign_key: true, :null => true, on_delete: :cascade
      t.integer :estatus, :null => false, :default => 1
      t.references :tipo_cita, foreign_key: true, :null => true

      t.timestamps
    end
  end
end
