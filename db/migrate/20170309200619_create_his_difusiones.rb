class CreateHisDifusiones < ActiveRecord::Migration[5.0]
  def change
    create_table :his_difusiones do |t|
      t.text :asunto
      t.text :texto
      t.attachment :imagen
      t.integer :tipo_entidad
      t.integer :entidad
      t.string :token
      t.integer :tipo_difusion
      t.integer :estatus

      t.timestamps
    end
  end
end
