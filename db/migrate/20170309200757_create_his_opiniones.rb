class CreateHisOpiniones < ActiveRecord::Migration[5.0]
  def change
    create_table :his_opiniones do |t|
      t.string :correo
      t.string :nombre
      t.string :descripcion
      t.integer :tipo_opinion
      t.integer :motivo
      t.integer :estatus

      t.timestamps
    end
  end
end
