class AddRoleIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :usuarios, :rol, foreign_key: true
  end
end
