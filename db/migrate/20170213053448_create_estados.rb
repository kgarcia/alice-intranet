class CreateEstados < ActiveRecord::Migration[5.0]
  def change
    create_table :estados do |t|
      t.string :descripcion
      t.integer :estatus
      t.references :pais, foreign_key: true

      t.timestamps
    end
  end
end
