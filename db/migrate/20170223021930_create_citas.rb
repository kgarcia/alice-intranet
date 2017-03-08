class CreateCitas < ActiveRecord::Migration[5.0]
  def change
    create_table :citas do |t|
      t.references :turno, foreign_key: true, :null => false
      t.references :persona, foreign_key: true, :null => false
      t.references :usuario, foreign_key: true, :null => true
      t.timestamp :fecha
      t.references :tipo_pago, foreign_key: true, :null => true
      t.references :eventualidad, foreign_key: true, :null => true
      t.integer :estatus, :null => false, :default => 1

      t.timestamps
    end
  end
end
