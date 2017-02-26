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

ActiveRecord::Schema.define(version: 20170222023814) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adicciones", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "tipo_adicciones_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["tipo_adicciones_id"], name: "index_adicciones_on_tipo_adicciones_id", using: :btree
  end

  create_table "cirugias", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "tipo_cirugias_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["tipo_cirugias_id"], name: "index_cirugias_on_tipo_cirugias_id", using: :btree
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
    t.integer  "tipo_discapacidades_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["tipo_discapacidades_id"], name: "index_discapacidades_on_tipo_discapacidades_id", using: :btree
  end

  create_table "estado_civiles", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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

  create_table "habitos", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "tipo_habitos_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["tipo_habitos_id"], name: "index_habitos_on_tipo_habitos_id", using: :btree
  end

  create_table "lesiones", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "tipo_lesiones_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["tipo_lesiones_id"], name: "index_lesiones_on_tipo_lesiones_id", using: :btree
  end

  create_table "noticias", force: :cascade do |t|
    t.string   "titulo"
    t.string   "descripcion"
    t.integer  "tipo_noticia_id"
    t.integer  "estatus"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["tipo_noticia_id"], name: "index_noticias_on_tipo_noticia_id", using: :btree
  end

  create_table "ocupaciones", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "opiniones", force: :cascade do |t|
    t.string   "correo"
    t.string   "nombre"
    t.string   "descripcion"
    t.integer  "tipo_opinion_id"
    t.integer  "estatus"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["tipo_opinion_id"], name: "index_opiniones_on_tipo_opinion_id", using: :btree
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

  create_table "paises", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "patologias", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "tipo_patologias_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["tipo_patologias_id"], name: "index_patologias_on_tipo_patologias_id", using: :btree
  end

  create_table "preguntas", force: :cascade do |t|
    t.string   "titulo"
    t.string   "descripcion"
    t.string   "respuesta"
    t.integer  "tipo_pregunta_id"
    t.integer  "estatus"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["tipo_pregunta_id"], name: "index_preguntas_on_tipo_pregunta_id", using: :btree
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

  create_table "tipo_noticias", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tipo_opiniones", force: :cascade do |t|
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

  create_table "tipo_preguntas", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

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

  add_foreign_key "adicciones", "tipo_adicciones", column: "tipo_adicciones_id"
  add_foreign_key "cirugias", "tipo_cirugias", column: "tipo_cirugias_id"
  add_foreign_key "ciudades", "estados"
  add_foreign_key "discapacidades", "tipo_discapacidades", column: "tipo_discapacidades_id"
  add_foreign_key "estados", "paises"
  add_foreign_key "habitos", "tipo_habitos", column: "tipo_habitos_id"
  add_foreign_key "lesiones", "tipo_lesiones", column: "tipo_lesiones_id"
  add_foreign_key "noticias", "tipo_noticias"
  add_foreign_key "opiniones", "tipo_opiniones"
  add_foreign_key "patologias", "tipo_patologias", column: "tipo_patologias_id"
  add_foreign_key "preguntas", "tipo_preguntas"
  add_foreign_key "ubicaciones", "ciudades"
  add_foreign_key "ubicaciones", "sectores"
  add_foreign_key "ubicaciones", "tipo_ubicaciones"
end
