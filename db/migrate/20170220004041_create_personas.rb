class CreatePersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :personas do |t|
      t.string :cedula
      t.string :nombre
      t.string :apellido
      t.string :telefono
      t.string :direccion
      t.date :fecha_nacimiento
      t.references :sexo, foreign_key: true
      t.integer :edad

      t.timestamps
    end
  end
end
