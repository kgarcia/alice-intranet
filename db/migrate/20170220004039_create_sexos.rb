class CreateSexos < ActiveRecord::Migration[5.0]
  def change
    create_table :sexos do |t|
      t.string :decripcion
      t.string :estatus

      t.timestamps
    end
  end
end
