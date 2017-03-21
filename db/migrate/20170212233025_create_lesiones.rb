class CreateLesiones < ActiveRecord::Migration[5.0]
  def change
    create_table :lesiones do |t|
      t.string :descripcion, :null => false
      t.integer :estatus, :null => false, :default => 1
      t.references :tipo_lesion, foreign_key: true, :null => false, on_delete: :cascade

      t.timestamps
    end
  end
end
