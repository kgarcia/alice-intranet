class AddSlugToTipoServicio < ActiveRecord::Migration[5.0]
  def change
    add_column :tipo_servicios, :slug, :string
    add_index :tipo_servicios, :slug, unique: true
  end
end
