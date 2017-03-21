class CreateDifusiones < ActiveRecord::Migration[5.0]
  def change
    create_table :difusiones do |t|
      t.text :asunto
      t.text :texto
      t.attachment :imagen
      t.references :tipo_entidad, foreign_key: true, on_delete: :cascade
      t.references :entidad, on_delete: :cascade
      t.string :token_facebook
      t.references :tipo_difusion, foreign_key: true, :null => false, on_delete: :cascade
      t.integer :estatus, :null => false, :default => 1

      t.timestamps
    end
  end
end
