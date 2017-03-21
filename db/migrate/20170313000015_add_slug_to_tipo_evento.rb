class AddSlugToTipoEvento < ActiveRecord::Migration[5.0]
  def change
    add_column :tipo_eventos, :slug, :string
    add_index :tipo_eventos, :slug, unique: true
  end
end
