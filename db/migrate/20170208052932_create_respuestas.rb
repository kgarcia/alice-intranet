class CreateRespuestas < ActiveRecord::Migration
  def change
    create_table :respuestas do |t|
      t.string :descripcion
      t.string :estatus

      t.timestamps null: false
    end
  end
end
