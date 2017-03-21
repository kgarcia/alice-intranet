class CreateDiscapacidades < ActiveRecord::Migration[5.0]
  def change
    create_table :discapacidades do |t|
      t.string :descripcion, :null => false
      t.integer :estatus, :null => false, :default => 1
      t.references :tipo_discapacidad, foreign_key: true, :null => false, on_delete: :cascade

      t.timestamps
    end
  end
end
