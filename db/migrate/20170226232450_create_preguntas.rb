class CreatePreguntas < ActiveRecord::Migration[5.0]
  def change
    create_table :preguntas do |t|
      t.string :descripcion, :null => false
      t.string :respuesta
      t.references :tipo_pregunta, foreign_key: true
      t.integer :estatus, :null => false, :default => 1
      t.timestamps
    end
  end
end
