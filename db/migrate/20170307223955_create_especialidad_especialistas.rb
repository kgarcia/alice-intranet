class CreateEspecialidadEspecialistas < ActiveRecord::Migration[5.0]
  def change
    create_table :especialidad_especialistas do |t|
      t.references :especialidad, foreign_key: true, on_delete: :cascade
      t.references :especialista, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
