class CreateTipoHorarios < ActiveRecord::Migration[5.0]
  def change
    create_table :tipo_horarios do |t|
      t.string :descripcion
      t.integer :estatus

      t.timestamps
    end
  end
end
