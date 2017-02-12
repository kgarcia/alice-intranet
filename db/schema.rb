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

ActiveRecord::Schema.define(version: 20170212200838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "discapacidades", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "tipo_discapacidades_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["tipo_discapacidades_id"], name: "index_discapacidades_on_tipo_discapacidades_id", using: :btree
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

  create_table "sexos", force: :cascade do |t|
    t.string   "descripcion"
    t.boolean  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tipo_discapacidades", force: :cascade do |t|
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

  create_table "vacunas", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "discapacidades", "tipo_discapacidades", column: "tipo_discapacidades_id"
  add_foreign_key "patologias", "tipo_patologias", column: "tipo_patologias_id"
end
