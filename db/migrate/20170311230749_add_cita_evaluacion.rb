class AddCitaEvaluacion < ActiveRecord::Migration[5.0]
  def change
    add_reference :evaluaciones, :cita, foreign_key: true, on_delete: :cascade
  end
end
