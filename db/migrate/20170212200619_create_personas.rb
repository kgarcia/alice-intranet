class CreatePersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :personas do |t|
      t.string :cedula, :null => true
      t.string :nombre, :null => true
      t.string :apellido, :null => true
      t.string :telefono, :null => true
      t.string :direccion, :null => true
      t.date :fecha_nacimiento, :null => true
      t.float :peso, :null => true
      t.float :altura, :null => true
      t.references :sexo, foreign_key: true, :null => false, on_delete: :cascade
      t.references :grupo_sanguineo, foreign_key: true, :null => true, on_delete: :cascade
      t.references :estado_civil, foreign_key: true, :null => true, on_delete: :cascade

      t.timestamps
    end
  end
end
