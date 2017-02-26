class CreateOpiniones < ActiveRecord::Migration[5.0]
  def change
    create_table :opiniones do |t|
      t.string :correo
      t.string :nombre
      t.string :descripcion
      t.references :tipo_opinion, foreign_key: true
      t.integer :estatus

      t.timestamps
    end
  end
end
