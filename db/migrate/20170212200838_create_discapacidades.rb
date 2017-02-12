class CreateDiscapacidades < ActiveRecord::Migration[5.0]
  def change
    create_table :discapacidades do |t|
      t.string :descripcion
      t.integer :estatus
      t.references :tipo_discapacidades, foreign_key: true

      t.timestamps
    end
  end
end
