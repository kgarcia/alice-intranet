class CreateConfiguraciones < ActiveRecord::Migration[5.0]
  def change
    create_table :configuraciones do |t|
      t.integer :envia_email
      t.integer :envia_notificaciones

      t.timestamps
    end
  end
end
