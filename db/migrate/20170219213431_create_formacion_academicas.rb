class CreateFormacionAcademicas < ActiveRecord::Migration[5.0]
  def change
    create_table :formacion_academicas do |t|
      t.string :descripcion
      t.integer :estatus
      t.references :nivel_formacion, foreign_key: true

      t.timestamps
    end
  end
end
