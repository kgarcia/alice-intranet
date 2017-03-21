class AddSlugToNoticia < ActiveRecord::Migration[5.0]
  def change
    add_column :noticias, :slug, :string
    add_index :noticias, :slug, unique: true
  end
end
