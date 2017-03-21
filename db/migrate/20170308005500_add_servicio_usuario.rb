class AddServicioUsuario < ActiveRecord::Migration[5.0]
  def change
    add_reference :usuarios, :servicio, foreign_key: true, on_delete: :cascade
  end
end
