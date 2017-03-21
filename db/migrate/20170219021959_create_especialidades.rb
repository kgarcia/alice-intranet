class CreateEspecialidades < ActiveRecord::Migration[5.0]
  def change
    create_table :especialidades do |t|
      t.string :descripcion, :null => false
      t.references :tipo_especialidad, on_delete: :cascade
      t.integer :estatus, :null => false, :default => 1

      t.timestamps
    end
  end
end
