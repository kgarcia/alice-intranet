class AddReferenciaToPersona < ActiveRecord::Migration[5.0]
  def change
  	add_reference :personas, :referencia, foreign_key: true, on_delete: :cascade
  end
end
