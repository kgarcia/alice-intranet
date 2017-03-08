class CreateCalificaciones < ActiveRecord::Migration[5.0]
  def change
    create_table :calificaciones do |t|
      t.string :descripcion
      t.integer :estatus
      t.references :tipo_calificacion, foreign_key: true
      t.references :criterio, foreign_key: true
      t.references :evaluacion, foreign_key: true
      
      t.timestamps
    end
  end
end
