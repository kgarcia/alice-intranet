class CreateCalificaciones < ActiveRecord::Migration[5.0]
  def change
    create_table :calificaciones do |t|
      t.string :descripcion, :null => false
      t.integer :estatus, :null => false, :default => 1
      t.references :tipo_calificacion, foreign_key: true, :null => false
      t.references :criterio, foreign_key: true, :null => false
      t.references :evaluacion, foreign_key: true, :null => false
      
      t.timestamps
    end
  end
end
