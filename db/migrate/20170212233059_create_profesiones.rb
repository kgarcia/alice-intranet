class CreateProfesiones < ActiveRecord::Migration[5.0]
  def change
    create_table :profesiones do |t|
      t.string :descripcion
      t.integer :estatus

      t.timestamps
    end
  end
end
