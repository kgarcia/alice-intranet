class CreateLesiones < ActiveRecord::Migration[5.0]
  def change
    create_table :lesiones do |t|
      t.string :descripcion
      t.integer :estatus
      t.references :tipo_lesion, foreign_key: true

      t.timestamps
    end
  end
end
