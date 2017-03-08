class CreateRangoPesos < ActiveRecord::Migration[5.0]
  def change
    create_table :rango_pesos do |t|
      t.string :descripcion
      t.integer :peso_inicial
      t.integer :peso_final
      t.integer :estatus, :null => false, :default => 1

      t.timestamps
    end
  end
end
