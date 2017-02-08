class CreateHabitos < ActiveRecord::Migration
  def change
    create_table :habitos do |t|
      t.string :descripcion
      t.string :estatus

      t.timestamps null: false
    end
  end
end
