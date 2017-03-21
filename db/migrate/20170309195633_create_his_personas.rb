class CreateHisPersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :his_personas do |t|
      t.string :cedula
      t.string :nombre
      t.string :apellido
      t.string :telefono
      t.string :direccion
      t.date :fecha_nacimiento
      t.integer :sexo

      t.timestamps
    end
  end
end
