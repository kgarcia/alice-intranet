class AddCitaEvaluacion < ActiveRecord::Migration[5.0]
  def change
    add_reference :evaluaciones, :cita, foreign_key: true
  end
end
