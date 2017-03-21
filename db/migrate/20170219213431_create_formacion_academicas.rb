class CreateFormacionAcademicas < ActiveRecord::Migration[5.0]
  def change
    create_table :formacion_academicas do |t|
      t.string :descripcion, :null => false
      t.integer :estatus, :null => false, :default => 1
      t.references :nivel_formacion, foreign_key: true, :null => false, on_delete: :cascade

      t.timestamps
    end
  end
end
