class CreateSexos < ActiveRecord::Migration[5.0]
  def change
    create_table :sexos do |t|
      t.string :descripcion
      t.string :estatus
      t.belongs_to :detalle_pefil_comun

      t.timestamps
    end
  end
end
