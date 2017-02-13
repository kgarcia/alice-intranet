class CreateCirugias < ActiveRecord::Migration[5.0]
  def change
    create_table :cirugias do |t|
      t.string :descripcion
      t.integer :estatus
      t.references :tipo_cirugias, foreign_key: true

      t.timestamps
    end
  end
end
