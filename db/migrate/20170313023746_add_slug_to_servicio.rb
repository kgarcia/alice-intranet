class AddSlugToServicio < ActiveRecord::Migration[5.0]
  def change
    add_column :servicios, :slug, :string
    add_index :servicios, :slug, unique: true
  end
end
