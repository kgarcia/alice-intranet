class CreateAdicciones < ActiveRecord::Migration[5.0]
  def change
    create_table :adicciones do |t|
      t.string :descripcion
      t.integer :estatus
      t.references :tipo_adicciones, foreign_key: true

      t.timestamps
    end
  end
end
