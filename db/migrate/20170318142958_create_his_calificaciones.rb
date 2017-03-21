class CreateHisCalificaciones < ActiveRecord::Migration[5.0]
  def change
    create_table :his_calificaciones do |t|
      t.string :descripcion
      t.integer :estatus
      t.integer :tipo_calificacion
      t.integer :criterio
      t.integer :evaluacion
      
      t.timestamps
    end
  end
end
