class CreateEspecialidads < ActiveRecord::Migration
  def change
    create_table :especialidads do |t|
      t.string :codigo
      t.string :nombre
      t.boolean :estatus

      t.timestamps null: false
    end
  end
end
