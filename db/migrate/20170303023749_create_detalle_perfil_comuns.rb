class CreateDetallePerfilComuns < ActiveRecord::Migration[5.0]
  def change
    create_table :detalle_perfil_comuns do |t|
      t.integer :estatus
      t.belongs_to :perfil_comuns, foreign_key: true
      t.reference :grupo_sanguineo, foreign_key: true
      t.reference :lesion, foreign_key: true
      t.reference :adiccion, foreign_key: true
      t.reference :rango_edad, foreign_key: true
      t.reference :rango_peso, foreign_key: true
      t.reference :patologia, foreign_key: true
      t.reference :profesion, foreign_key: true
      t.reference :ocupacion, foreign_key: true
      t.reference :cirugia, foreign_key: true
      t.reference :discapacidad, foreign_key: true
      t.reference :vacuna, foreign_key: true
      t.reference :habito, foreign_key: true
      t.reference :sexo, foreign_key: true
      t.reference :estado_civil, foreign_key: true


      t.timestamps
    end
  end
end
