class CreateParentescos < ActiveRecord::Migration[5.0]
  def change
    create_table :parentescos do |t|
      t.string :descripcion
      t.references :persona, foreign_key: true
      t.references :pariente, foreign_key: true
      t.references :tipo_parentesco, foreign_key: true
      t.integer :estatus
      t.timestamps
    end
  end
end
