class CreateEvaluaciones < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluaciones do |t|
      t.string :descripcion
      t.integer :estatus
      t.references :tipo_evaluacion, foreign_key: true

      t.timestamps
    end
  end
end
