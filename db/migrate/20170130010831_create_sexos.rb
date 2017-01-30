class CreateSexos < ActiveRecord::Migration
  def change
    create_table :sexos do |t|
      t.string :descripcion
	  t.boolean :estatus
      t.timestamps null: false
    end
  end
end
