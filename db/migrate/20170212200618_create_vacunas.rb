class CreateVacunas < ActiveRecord::Migration[5.0]
  def change
    create_table :vacunas do |t|
      t.string :descripcion
      t.integer :estatus
      t.belongs_to :detalle_pefil_comun

      t.timestamps
    end
  end
end
