class CreateNoticias < ActiveRecord::Migration[5.0]
  def change
    create_table :noticias do |t|
      t.string :titulo
      t.string :descripcion, :null => false 
      t.references :tipo_noticia, foreign_key: true, on_delete: :cascade
      t.integer :estatus, :null => false, :default => 1
      t.text :contenido
      t.timestamps
    end
  end
end
