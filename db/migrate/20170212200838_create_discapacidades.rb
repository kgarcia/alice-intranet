class CreateDiscapacidades < ActiveRecord::Migration[5.0]
  def change
    create_table :discapacidades do |t|
      t.string :descripcion
      t.integer :estatus
      t.references :tipo_discapacidad, foreign_key: true
      t.belongs_to :detalle_pefil_comun

      t.timestamps
    end
  end
end
