class CreateSuscriptores < ActiveRecord::Migration[5.0]
  def change
    create_table :suscriptores do |t|
      t.string :email
      t.references :persona, foreign_key: true
      t.integer :estatus

      t.timestamps
    end
  end
end
