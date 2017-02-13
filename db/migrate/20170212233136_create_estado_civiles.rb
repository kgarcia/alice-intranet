class CreateEstadoCiviles < ActiveRecord::Migration[5.0]
  def change
    create_table :estado_civiles do |t|
      t.string :descripcion
      t.integer :estatus

      t.timestamps
    end
  end
end
