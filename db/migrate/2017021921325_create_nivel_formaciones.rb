class CreateNivelFormaciones < ActiveRecord::Migration[5.0]
  def change
    create_table :nivel_formaciones do |t|
      t.string :descripcion
      t.integer :estatus

      t.timestamps
    end
  end
end
