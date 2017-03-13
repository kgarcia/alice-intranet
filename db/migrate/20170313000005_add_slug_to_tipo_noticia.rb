class AddSlugToTipoNoticia < ActiveRecord::Migration[5.0]
  def change
    add_column :tipo_noticias, :slug, :string
    add_index :tipo_noticias, :slug, unique: true
  end
end
