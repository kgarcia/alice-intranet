class CreateHisEspecialistas < ActiveRecord::Migration[5.0]
  def change
    create_table :his_especialistas do |t|
      t.integer :universidad
      t.integer :formacion_academica
      t.integer :persona
      t.integer :estatus

      t.timestamps
    end
  end
end
