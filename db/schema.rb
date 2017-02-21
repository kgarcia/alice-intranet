# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.


ActiveRecord::Schema.define(version: 20170221032257) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adiccion_tipo_servicios", force: :cascade do |t|
    t.integer  "adiccion_id"
    t.integer  "tipo_servicio_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["adiccion_id"], name: "index_adiccion_tipo_servicios_on_adiccion_id", using: :btree
    t.index ["tipo_servicio_id"], name: "index_adiccion_tipo_servicios_on_tipo_servicio_id", using: :btree
  end

  create_table "adicciones", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "tipo_adiccion_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["tipo_adiccion_id"], name: "index_adicciones_on_tipo_adiccion_id", using: :btree
  end

  create_table "cirugia_tipo_servicios", force: :cascade do |t|
    t.integer  "cirugia_id"
    t.integer  "tipo_servicio_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["cirugia_id"], name: "index_cirugia_tipo_servicios_on_cirugia_id", using: :btree
    t.index ["tipo_servicio_id"], name: "index_cirugia_tipo_servicios_on_tipo_servicio_id", using: :btree
  end

  create_table "cirugias", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "tipo_cirugia_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["tipo_cirugia_id"], name: "index_cirugias_on_tipo_cirugia_id", using: :btree
  end

  create_table "discapacidad_tipo_servicios", force: :cascade do |t|
    t.integer  "discapacidad_id"
    t.integer  "tipo_servicio_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["discapacidad_id"], name: "index_discapacidad_tipo_servicios_on_discapacidad_id", using: :btree
    t.index ["tipo_servicio_id"], name: "index_discapacidad_tipo_servicios_on_tipo_servicio_id", using: :btree
  end

  create_table "ciudades", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "estado_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["estado_id"], name: "index_ciudades_on_estado_id", using: :btree
  end

  create_table "discapacidades", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "tipo_discapacidad_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["tipo_discapacidad_id"], name: "index_discapacidades_on_tipo_discapacidad_id", using: :btree
  end

  create_table "estado_civil_tipo_servicios", force: :cascade do |t|
    t.integer  "estado_civil_id"
    t.integer  "tipo_servicio_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["estado_civil_id"], name: "index_estado_civil_tipo_servicios_on_estado_civil_id", using: :btree
    t.index ["tipo_servicio_id"], name: "index_estado_civil_tipo_servicios_on_tipo_servicio_id", using: :btree
  end

  create_table "estado_civiles", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end


  create_table "grupo_sanguineo_tipo_servicios", force: :cascade do |t|
    t.integer  "grupo_sanguineo_id"
    t.integer  "tipo_servicio_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["grupo_sanguineo_id"], name: "index_grupo_sanguineo_tipo_servicios_on_grupo_sanguineo_id", using: :btree
    t.index ["tipo_servicio_id"], name: "index_grupo_sanguineo_tipo_servicios_on_tipo_servicio_id", using: :btree
  end

  create_table "estados", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "pais_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["pais_id"], name: "index_estados_on_pais_id", using: :btree
  end

  create_table "grupo_sanguineos", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "habito_tipo_servicios", force: :cascade do |t|
    t.integer  "habito_id"
    t.integer  "tipo_servicio_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["habito_id"], name: "index_habito_tipo_servicios_on_habito_id", using: :btree
    t.index ["tipo_servicio_id"], name: "index_habito_tipo_servicios_on_tipo_servicio_id", using: :btree
  end

  create_table "habitos", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "tipo_habito_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["tipo_habito_id"], name: "index_habitos_on_tipo_habito_id", using: :btree
  end

  create_table "lesion_tipo_servicios", force: :cascade do |t|
    t.integer  "lesion_id"
    t.integer  "tipo_servicio_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["lesion_id"], name: "index_lesion_tipo_servicios_on_lesion_id", using: :btree
    t.index ["tipo_servicio_id"], name: "index_lesion_tipo_servicios_on_tipo_servicio_id", using: :btree
  end

  create_table "lesiones", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "tipo_lesion_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["tipo_lesion_id"], name: "index_lesiones_on_tipo_lesion_id", using: :btree
  end

  create_table "ocupacion_tipo_servicios", force: :cascade do |t|
    t.integer  "ocupacion_id"
    t.integer  "tipo_servicio_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["ocupacion_id"], name: "index_ocupacion_tipo_servicios_on_ocupacion_id", using: :btree
    t.index ["tipo_servicio_id"], name: "index_ocupacion_tipo_servicios_on_tipo_servicio_id", using: :btree
  end

  create_table "ocupaciones", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "option_menus", force: :cascade do |t|
    t.integer  "id_padre"
    t.string   "nombre"
    t.string   "url_path"
    t.string   "icono"
    t.string   "controlador"
    t.string   "accion"
    t.integer  "num_hijos"
    t.string   "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "patologia_tipo_servicios", force: :cascade do |t|
    t.integer  "patologia_id"
    t.integer  "tipo_servicio_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["patologia_id"], name: "index_patologia_tipo_servicios_on_patologia_id", using: :btree
    t.index ["tipo_servicio_id"], name: "index_patologia_tipo_servicios_on_tipo_servicio_id", using: :btree
  end
  
  create_table "paises", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "patologias", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "tipo_patologia_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["tipo_patologia_id"], name: "index_patologias_on_tipo_patologia_id", using: :btree
  end

  create_table "preguntas", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "profesion_tipo_servicios", force: :cascade do |t|
    t.integer  "profesion_id"
    t.integer  "tipo_servicio_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["profesion_id"], name: "index_profesion_tipo_servicios_on_profesion_id", using: :btree
    t.index ["tipo_servicio_id"], name: "index_profesion_tipo_servicios_on_tipo_servicio_id", using: :btree
  end

  create_table "profesiones", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sectores", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

   create_table "tipo_adicciones", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tipo_atenciones", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tipo_cirugias", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tipo_discapacidades", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tipo_habitos", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tipo_lesiones", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tipo_patologias", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end


  create_table "tipo_servicio_vacunas", force: :cascade do |t|
    t.integer  "vacuna_id"
    t.integer  "tipo_servicio_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["tipo_servicio_id"], name: "index_tipo_servicio_vacunas_on_tipo_servicio_id", using: :btree
    t.index ["vacuna_id"], name: "index_tipo_servicio_vacunas_on_vacuna_id", using: :btree
  end

  create_table "tipo_servicios", force: :cascade do |t|
    t.string   "descripcion"
    t.text     "texto"
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.integer  "estatus"
    t.integer  "tipo_atencion_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["tipo_atencion_id"], name: "index_tipo_servicios_on_tipo_atencion_id", using: :btree

  create_table "tipo_ubicaciones", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ubicaciones", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "sector_id"
    t.integer  "ciudad_id"
    t.integer  "tipo_ubicacion_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["ciudad_id"], name: "index_ubicaciones_on_ciudad_id", using: :btree
    t.index ["sector_id"], name: "index_ubicaciones_on_sector_id", using: :btree
    t.index ["tipo_ubicacion_id"], name: "index_ubicaciones_on_tipo_ubicacion_id", using: :btree

  end

  create_table "vacunas", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end
  add_foreign_key "adiccion_tipo_servicios", "adicciones"
  add_foreign_key "adiccion_tipo_servicios", "tipo_servicios"
  add_foreign_key "adicciones", "tipo_adicciones"
  add_foreign_key "cirugia_tipo_servicios", "cirugias"
  add_foreign_key "cirugia_tipo_servicios", "tipo_servicios"
  add_foreign_key "cirugias", "tipo_cirugias"
  add_foreign_key "discapacidad_tipo_servicios", "discapacidades"
  add_foreign_key "discapacidad_tipo_servicios", "tipo_servicios"
  add_foreign_key "discapacidades", "tipo_discapacidades"
  add_foreign_key "estado_civil_tipo_servicios", "estado_civiles"
  add_foreign_key "estado_civil_tipo_servicios", "tipo_servicios"
  add_foreign_key "grupo_sanguineo_tipo_servicios", "grupo_sanguineos"
  add_foreign_key "grupo_sanguineo_tipo_servicios", "tipo_servicios"
  add_foreign_key "habito_tipo_servicios", "habitos"
  add_foreign_key "habito_tipo_servicios", "tipo_servicios"
  add_foreign_key "habitos", "tipo_habitos"
  add_foreign_key "lesion_tipo_servicios", "lesiones"
  add_foreign_key "lesion_tipo_servicios", "tipo_servicios"
  add_foreign_key "lesiones", "tipo_lesiones"
  add_foreign_key "ocupacion_tipo_servicios", "ocupaciones"
  add_foreign_key "ocupacion_tipo_servicios", "tipo_servicios"
  add_foreign_key "patologia_tipo_servicios", "patologias"
  add_foreign_key "patologia_tipo_servicios", "tipo_servicios"
  add_foreign_key "patologias", "tipo_patologias"
  add_foreign_key "profesion_tipo_servicios", "profesiones"
  add_foreign_key "profesion_tipo_servicios", "tipo_servicios"
  add_foreign_key "tipo_servicio_vacunas", "tipo_servicios"
  add_foreign_key "tipo_servicio_vacunas", "vacunas"
  add_foreign_key "tipo_servicios", "tipo_atenciones"
  add_foreign_key "adicciones", "tipo_adicciones", column: "tipo_adicciones_id"
  add_foreign_key "cirugias", "tipo_cirugias", column: "tipo_cirugias_id"
  add_foreign_key "ciudades", "estados"
  add_foreign_key "discapacidades", "tipo_discapacidades", column: "tipo_discapacidades_id"
  add_foreign_key "estados", "paises"
  add_foreign_key "habitos", "tipo_habitos", column: "tipo_habitos_id"
  add_foreign_key "lesiones", "tipo_lesiones", column: "tipo_lesiones_id"
  add_foreign_key "patologias", "tipo_patologias", column: "tipo_patologias_id"
  add_foreign_key "ubicaciones", "ciudades"
  add_foreign_key "ubicaciones", "sectores"
  add_foreign_key "ubicaciones", "tipo_ubicaciones"
end
