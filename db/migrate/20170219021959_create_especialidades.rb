class CreateEspecialidades < ActiveRecord::Migration[5.0]
  def change
    create_table :especialidades do |t|
      t.string :descripcion
      t.integer :estatus
      t.references :tipo_especialidad, foreign_key: true
      t.references :especialista, foreign_key: true

      t.timestamps
    end
  end
end
