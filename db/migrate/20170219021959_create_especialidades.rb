class CreateEspecialidades < ActiveRecord::Migration[5.0]
  def change
    create_table :especialidades do |t|
      t.string :descripcion
      t.integer :estatus
      t.references :tipo_especialidad
      t.references :especialista

      t.timestamps
    end
  end
end
