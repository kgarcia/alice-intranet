class CreateEspecialista < ActiveRecord::Migration
  def change
    create_table :especialista do |t|
      t.string :cedula
      t.string :nombre
      t.string :apellido
      t.references :especialidad, index: true, foreign_key: true
      t.date :fecha_ingreso
      t.references :sexo, index: true, foreign_key: true
      t.text :curriculum
      t.integer :edad
      t.boolean :estatus
      t.timestamps null: false
    end
  end
end
