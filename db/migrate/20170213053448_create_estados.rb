class CreateEstados < ActiveRecord::Migration[5.0]
  def change
    create_table :estados do |t|
      t.string :descripcion, :null => false
      t.integer :estatus, :null => false, :default => 1
      t.references :pais, foreign_key: true, :null => false, on_delete: :cascade

      t.timestamps
    end
  end
end
