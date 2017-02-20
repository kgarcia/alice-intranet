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

ActiveRecord::Schema.define(version: 20170219083325) do

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
    t.integer  "tipo_cirugias_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["tipo_cirugias_id"], name: "index_cirugias_on_tipo_cirugias_id", using: :btree
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

  create_table "patologias", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "tipo_patologias_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["tipo_patologias_id"], name: "index_patologias_on_tipo_patologias_id", using: :btree
  end

  create_table "preguntas", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "profesiones", force: :cascade do |t|
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
  add_foreign_key "cirugias", "tipo_cirugias", column: "tipo_cirugias_id"
  add_foreign_key "discapacidades", "tipo_discapacidades", column: "tipo_discapacidades_id"
  add_foreign_key "habitos", "tipo_habitos", column: "tipo_habitos_id"
  add_foreign_key "lesiones", "tipo_lesiones", column: "tipo_lesiones_id"
  add_foreign_key "patologias", "tipo_patologias", column: "tipo_patologias_id"
  add_foreign_key "tipo_servicios", "tipo_atenciones"
end
