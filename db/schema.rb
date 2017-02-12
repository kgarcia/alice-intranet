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

ActiveRecord::Schema.define(version: 20170212211153) do

  create_table "especialidads", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.boolean  "estatus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "especialista", force: :cascade do |t|
    t.string   "cedula"
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "especialidad_id"
    t.date     "fecha_ingreso"
    t.integer  "sexo_id"
    t.text     "curriculum"
    t.integer  "edad"
    t.boolean  "estatus"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["especialidad_id"], name: "index_especialista_on_especialidad_id"
    t.index ["sexo_id"], name: "index_especialista_on_sexo_id"
  end

  create_table "habitos", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "TipoHabito_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["TipoHabito_id"], name: "index_habitos_on_TipoHabito_id"
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

  create_table "sexos", force: :cascade do |t|
    t.string   "descripcion"
    t.boolean  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tipo_habitos", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
