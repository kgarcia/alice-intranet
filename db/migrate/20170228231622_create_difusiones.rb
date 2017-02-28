class CreateDifusiones < ActiveRecord::Migration[5.0]
  def change
    create_table :difusiones do |t|
      t.text :asunto
      t.text :texto
      t.attatchment :imagen
      t.references :tipo_entidad, foreign_key: true
      t.references :entidad, foreign_key: true
      t.string :token_facebook
      t.references :tipo_difusion, foreign_key: true
      t.integer :estatus

      t.timestamps
    end
  end
end
