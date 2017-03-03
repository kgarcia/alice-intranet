class CreateRangoEdades < ActiveRecord::Migration[5.0]
  def change
    create_table :rango_edades do |t|
      t.string :descripcion
      t.integer :edad_inicial
      t.integer :edad_final
      t.integer :estatus
      t.belongs_to :detalle_perfil_comun

      t.timestamps
    end
  end
end
