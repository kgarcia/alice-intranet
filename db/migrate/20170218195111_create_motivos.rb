class CreateMotivos < ActiveRecord::Migration[5.0]
  def change
    create_table :motivos do |t|
      t.string :descripcion
      t.integer :estatus
      t.references :tipo_motivo, foreign_key: true

      t.timestamps
    end
  end
end
