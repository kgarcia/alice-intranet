class CreatePatologias < ActiveRecord::Migration[5.0]
  def change
    create_table :patologias do |t|
      t.string :descripcion, :null => false
      t.integer :estatus, :null => false, :default => 1
      t.references :tipo_patologia, foreign_key: true, :null => false, on_delete: :cascade

      t.timestamps
    end
  end
end
