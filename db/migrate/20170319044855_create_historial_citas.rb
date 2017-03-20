class CreateHistorialCitas < ActiveRecord::Migration[5.0]
  def change
    create_table :historial_citas do |t|
      t.integer :estatus_nuevo, :null => false
      t.integer :estatus_anterior, :null => false
      t.timestamp :fecha, :null => false
      t.references :cita, foreign_key: true, :null => false
      
      t.timestamps
    end
  end
end
