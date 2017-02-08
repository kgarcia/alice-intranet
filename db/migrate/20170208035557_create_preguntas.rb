class CreatePreguntas < ActiveRecord::Migration
  def change
    create_table :preguntas do |t|
      t.string :descripcion
      t.string :estatus

      t.timestamps null: false
    end
  end
end
