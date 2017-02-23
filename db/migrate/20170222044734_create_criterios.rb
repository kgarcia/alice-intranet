class CreateCriterios < ActiveRecord::Migration[5.0]
  def change
    create_table :criterios do |t|
      t.string :descripcion
      t.integer :estatus
      t.references :tipo_criterio, foreign_key: true

      t.timestamps
    end
  end
end
