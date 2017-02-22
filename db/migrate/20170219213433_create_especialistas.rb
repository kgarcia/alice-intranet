class CreateEspecialistas < ActiveRecord::Migration[5.0]
  def change
    create_table :especialistas do |t|
      t.references :especialidad, foreign_key: true
      t.string :descripcion
      t.string :estatus

      t.timestamps
    end
  end
end
