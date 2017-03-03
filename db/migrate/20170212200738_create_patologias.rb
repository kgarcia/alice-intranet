class CreatePatologias < ActiveRecord::Migration[5.0]
  def change
    create_table :patologias do |t|
      t.string :descripcion
      t.integer :estatus
      t.references :tipo_patologia, foreign_key: true
      t.belongs_to :detalle_pefil_comun

      t.timestamps
    end
  end
end
