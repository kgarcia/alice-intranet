class CreateParentescos < ActiveRecord::Migration[5.0]
  def change
    create_table :parentescos do |t|
      t.string :descripcion
      t.references :persona, foreign_key: true, :null => false, on_delete: :cascade
      t.references :pariente, :null => false, on_delete: :cascade
      t.references :tipo_parentesco, foreign_key: true, :null => false, on_delete: :cascade
      t.integer :estatus, :null => false, :default => 1
      t.timestamps
    end
  end
end
