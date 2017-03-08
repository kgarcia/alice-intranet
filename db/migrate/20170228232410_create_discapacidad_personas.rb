class CreateDiscapacidadPersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :discapacidad_personas do |t|
      t.references :persona, foreign_key: true
      t.references :discapacidad, foreign_key: true

      t.timestamps
    end
  end
end
