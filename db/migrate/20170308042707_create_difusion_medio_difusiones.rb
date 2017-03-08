class CreateDifusionMedioDifusiones < ActiveRecord::Migration[5.0]
  def change
    create_table :difusion_medio_difusiones do |t|
      t.references :difusion, foreign_key: true
      t.references :medio_difusion, foreign_key: true

      t.timestamps
    end
  end
end
