class AddDiagnosticoCita < ActiveRecord::Migration[5.0]
  def up
    add_column :citas, :diagnostico, :text
  end

  def down
    remove_columns :citas, :diagnostico
  end
end
