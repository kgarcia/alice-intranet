class AddPersonaToUsuario < ActiveRecord::Migration[5.0]
  def change
    add_reference :usuarios, :persona, foreign_key: true
  end
end
