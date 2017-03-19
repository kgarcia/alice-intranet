class CreateBdAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :bd_admins do |t|
      t.string :historico, :array => true, :default => []
      t.timestamp :hora_backup
      t.integer :opcion_estatus
      t.timestamp :fecha_inicio
      t.integer :estatus

      t.timestamps
    end
  end
end
