class CreatePreguntas < ActiveRecord::Migration[5.0]
  def change
    create_table :preguntas do |t|
      t.string :titulo
      t.string :descripcion
      t.string :respuesta
      t.references :tipo_pregunta, foreign_key: true
      t.integer :estatus

      t.timestamps
    end
  end
end
