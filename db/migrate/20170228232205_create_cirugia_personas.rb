class CreateCirugiaPersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :cirugia_personas do |t|
      t.references :persona, foreign_key: true
      t.references :cirugia, foreign_key: true

      t.timestamps
    end
  end
end
