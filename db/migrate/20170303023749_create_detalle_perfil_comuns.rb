class CreateDetallePerfilComuns < ActiveRecord::Migration[5.0]
  def change
    create_table :detalle_perfil_comuns do |t|
      t.integer :estatus
      t.belongs_to :perfil_comuns, foreign_key: true
      t.references :grupo_sanguineo, foreign_key: true
      t.references :lesion, foreign_key: true
      t.references :adiccion, foreign_key: true
      t.references :rango_edad, foreign_key: true
      t.references :rango_peso, foreign_key: true
      t.references :patologia, foreign_key: true
      t.references :profesion, foreign_key: true
      t.references :ocupacion, foreign_key: true
      t.references :cirugia, foreign_key: true
      t.references :discapacidad, foreign_key: true
      t.references :vacuna, foreign_key: true
      t.references :habito, foreign_key: true
      t.references :sexo, foreign_key: true
      t.references :estado_civil, foreign_key: true


      t.timestamps
    end
  end
end
