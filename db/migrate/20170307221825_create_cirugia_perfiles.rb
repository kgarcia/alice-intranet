class CreateCirugiaPerfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :cirugia_perfiles do |t|
      t.references :cirugia, foreign_key: true, on_delete: :cascade
      t.references :perfil, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
