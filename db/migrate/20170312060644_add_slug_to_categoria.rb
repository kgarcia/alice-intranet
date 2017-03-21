class AddSlugToCategoria < ActiveRecord::Migration[5.0]
  def change
    add_column :categorias, :slug, :string
    add_index :categorias, :slug, unique: true
  end
end
