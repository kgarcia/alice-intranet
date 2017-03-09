class AddServicioUsuario < ActiveRecord::Migration[5.0]
  def change
    add_reference :usuarios, :servicio, foreign_key: true
  end
end
