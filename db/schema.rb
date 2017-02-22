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

ActiveRecord::Schema.define(version: 20170220004438) do

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

  create_table "option_roles", force: :cascade do |t|
    t.integer  "option_menu_id"
    t.integer  "rol_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["option_menu_id"], name: "index_option_roles_on_option_menu_id", using: :btree
    t.index ["rol_id"], name: "index_option_roles_on_rol_id", using: :btree
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

  create_table "personas", force: :cascade do |t|
    t.string   "cedula"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "telefono"
    t.string   "direccion"
    t.date     "fecha_nacimiento"
    t.integer  "sexo_id"
    t.integer  "edad"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["sexo_id"], name: "index_personas_on_sexo_id", using: :btree
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

  create_table "roles", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sexos", force: :cascade do |t|
    t.string   "decripcion"
    t.string   "estatus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "tipo_patologias", force: :cascade do |t|
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
    t.integer  "ciudad_id"
    t.integer  "tipo_ubicacion_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["ciudad_id"], name: "index_ubicaciones_on_ciudad_id", using: :btree
    t.index ["tipo_ubicacion_id"], name: "index_ubicaciones_on_tipo_ubicacion_id", using: :btree
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "rol_id"
    t.integer  "persona_id"
    t.index ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
    t.index ["persona_id"], name: "index_usuarios_on_persona_id", using: :btree
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree
    t.index ["rol_id"], name: "index_usuarios_on_rol_id", using: :btree
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
  add_foreign_key "option_roles", "option_menus"
  add_foreign_key "option_roles", "roles"
  add_foreign_key "patologias", "tipo_patologias", column: "tipo_patologias_id"
  add_foreign_key "personas", "sexos"
  add_foreign_key "ubicaciones", "ciudades"
  add_foreign_key "ubicaciones", "tipo_ubicaciones"
  add_foreign_key "usuarios", "personas"
  add_foreign_key "usuarios", "roles"
end
