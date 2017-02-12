class CreateHabitos < ActiveRecord::Migration[5.0]
  def change
    create_table :habitos do |t|
      t.string :descripcion
      t.integer :estatus
      t.references :TipoHabito, foreign_key: true

      t.timestamps
    end
  end
end
