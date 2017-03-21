class CreateOpiniones < ActiveRecord::Migration[5.0]
  def change
    create_table :opiniones do |t|
      t.string :correo
      t.string :nombre
      t.string :descripcion, :null => false
      t.references :tipo_opinion, foreign_key: true, on_delete: :cascade
      t.references :motivo, foreign_key: true, on_delete: :cascade
      t.integer :estatus, :null => false, :default => 1

      t.timestamps
    end
  end
end
