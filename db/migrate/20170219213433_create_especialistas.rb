class CreateEspecialistas < ActiveRecord::Migration[5.0]
  def change
    create_table :especialistas do |t|
      t.references :especialidad, foreign_key: true
      t.references :universidad, foreign_key: true
      t.references :formacion_academica, foreign_key: true
      t.references :persona, foreign_key: true
      t.string :estatus
      t.timestamps
    end
  end
end
