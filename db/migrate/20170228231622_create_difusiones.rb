class CreateDifusiones < ActiveRecord::Migration[5.0]
  def change
    create_table :difusiones do |t|
      t.text :asunto
      t.text :texto
      t.attachment :imagen
      t.references :tipo_entidad, foreign_key: true
      t.references :entidad
      t.string :token_facebook
      t.references :tipo_difusion, foreign_key: true, :null => false
      t.integer :estatus, :null => false, :default => 1

      t.timestamps
    end
  end
end
