class AddUsuarioToNotificacions < ActiveRecord::Migration[5.0]
  def change
    add_reference :notificaciones, :usuario, foreign_key: true
  end
end
