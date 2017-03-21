class CreateDifusionMedioDifusiones < ActiveRecord::Migration[5.0]
  def change
    create_table :difusion_medio_difusiones do |t|
      t.references :difusion, foreign_key: true, on_delete: :cascade
      t.references :medio_difusion, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
