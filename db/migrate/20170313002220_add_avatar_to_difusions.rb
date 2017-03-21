class AddAvatarToDifusions < ActiveRecord::Migration[5.0]
  def change
    add_column :difusiones, :avatar, :string
  end
end
