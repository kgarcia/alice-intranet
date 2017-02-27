class CreateSexos < ActiveRecord::Migration[5.0]
  def change
    create_table :sexos do |t|
      t.string :descripcion
      t.string :estatus

      t.timestamps
    end
  end
end
