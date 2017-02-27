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

ActiveRecord::Schema.define(version: 20170226232439) do

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

  create_table "busquedas", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "tipo_busqueda_id"
    t.integer  "especialidad_id"
    t.integer  "especialista_id"
    t.integer  "tipo_servicio_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["especialidad_id"], name: "index_busquedas_on_especialidad_id", using: :btree
    t.index ["especialista_id"], name: "index_busquedas_on_especialista_id", using: :btree
    t.index ["tipo_busqueda_id"], name: "index_busquedas_on_tipo_busqueda_id", using: :btree
    t.index ["tipo_servicio_id"], name: "index_busquedas_on_tipo_servicio_id", using: :btree
  end

  create_table "calificaciones", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "tipo_calificacion_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["tipo_calificacion_id"], name: "index_calificaciones_on_tipo_calificacion_id", using: :btree
  end

  create_table "categorias", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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

  create_table "citas", force: :cascade do |t|
    t.integer  "turno_id"
    t.integer  "persona_id"
    t.integer  "usuario_id"
    t.datetime "fecha"
    t.integer  "tipo_pago_id"
    t.integer  "tipo_cita_id"
    t.integer  "estatus"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["persona_id"], name: "index_citas_on_persona_id", using: :btree
    t.index ["tipo_cita_id"], name: "index_citas_on_tipo_cita_id", using: :btree
    t.index ["tipo_pago_id"], name: "index_citas_on_tipo_pago_id", using: :btree
    t.index ["turno_id"], name: "index_citas_on_turno_id", using: :btree
    t.index ["usuario_id"], name: "index_citas_on_usuario_id", using: :btree
  end

  create_table "ciudades", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "estado_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["estado_id"], name: "index_ciudades_on_estado_id", using: :btree
  end

  create_table "criterio_tipo_servicios", force: :cascade do |t|
    t.integer  "criterio_id"
    t.integer  "tipo_servicio_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["criterio_id"], name: "index_criterio_tipo_servicios_on_criterio_id", using: :btree
    t.index ["tipo_servicio_id"], name: "index_criterio_tipo_servicios_on_tipo_servicio_id", using: :btree
  end

  create_table "criterios", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "tipo_criterio_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["tipo_criterio_id"], name: "index_criterios_on_tipo_criterio_id", using: :btree
  end

  create_table "dias", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "discapacidad_tipo_servicios", force: :cascade do |t|
    t.integer  "discapacidad_id"
    t.integer  "tipo_servicio_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["discapacidad_id"], name: "index_discapacidad_tipo_servicios_on_discapacidad_id", using: :btree
    t.index ["tipo_servicio_id"], name: "index_discapacidad_tipo_servicios_on_tipo_servicio_id", using: :btree
  end

  create_table "discapacidades", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "tipo_discapacidad_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["tipo_discapacidad_id"], name: "index_discapacidades_on_tipo_discapacidad_id", using: :btree
  end

  create_table "especialidades", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "especialistas", force: :cascade do |t|
    t.integer  "especialidad_id"
    t.string   "descripcion"
    t.string   "estatus"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["especialidad_id"], name: "index_especialistas_on_especialidad_id", using: :btree
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

  create_table "estados", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "pais_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["pais_id"], name: "index_estados_on_pais_id", using: :btree
  end

  create_table "evaluaciones", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "tipo_evaluacion_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["tipo_evaluacion_id"], name: "index_evaluaciones_on_tipo_evaluacion_id", using: :btree
  end

  create_table "eventos", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "tipo_evento_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["tipo_evento_id"], name: "index_eventos_on_tipo_evento_id", using: :btree
  end

  create_table "eventualidades", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "tipo_eventualidad_id"
    t.integer  "motivo_id"
    t.datetime "fecha_inicio"
    t.datetime "fecha_fin"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["motivo_id"], name: "index_eventualidades_on_motivo_id", using: :btree
    t.index ["tipo_eventualidad_id"], name: "index_eventualidades_on_tipo_eventualidad_id", using: :btree
  end

  create_table "grupo_sanguineo_tipo_servicios", force: :cascade do |t|
    t.integer  "grupo_sanguineo_id"
    t.integer  "tipo_servicio_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["grupo_sanguineo_id"], name: "index_grupo_sanguineo_tipo_servicios_on_grupo_sanguineo_id", using: :btree
    t.index ["tipo_servicio_id"], name: "index_grupo_sanguineo_tipo_servicios_on_tipo_servicio_id", using: :btree
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

  create_table "horarios", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "tiempo_cita"
    t.integer  "estatus"
    t.integer  "tipo_horario_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["tipo_horario_id"], name: "index_horarios_on_tipo_horario_id", using: :btree
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

  create_table "motivos", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "tipo_motivo_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["tipo_motivo_id"], name: "index_motivos_on_tipo_motivo_id", using: :btree
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

  create_table "opiniones", force: :cascade do |t|
    t.string   "correo"
    t.string   "nombre"
    t.string   "descripcion"
    t.integer  "tipo_opinion_id"
    t.integer  "motivo_id"
    t.integer  "estatus"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["motivo_id"], name: "index_opiniones_on_motivo_id", using: :btree
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
    t.string   "codigo"
    t.integer  "estatus"
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

  create_table "patologias", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.integer  "tipo_patologia_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["tipo_patologia_id"], name: "index_patologias_on_tipo_patologia_id", using: :btree
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
    t.string   "titulo"
    t.string   "descripcion"
    t.string   "respuesta"
    t.integer  "tipo_pregunta_id"
    t.integer  "estatus"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["tipo_pregunta_id"], name: "index_preguntas_on_tipo_pregunta_id", using: :btree
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

  create_table "roles", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sectores", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "servicios", force: :cascade do |t|
    t.text     "descripcion"
    t.integer  "ubicacion_id"
    t.integer  "tipo_servicio_id"
    t.integer  "especialista_id"
    t.integer  "estatus"
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.float    "precio"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["especialista_id"], name: "index_servicios_on_especialista_id", using: :btree
    t.index ["tipo_servicio_id"], name: "index_servicios_on_tipo_servicio_id", using: :btree
    t.index ["ubicacion_id"], name: "index_servicios_on_ubicacion_id", using: :btree
  end

  create_table "sexo_tipo_servicios", force: :cascade do |t|
    t.integer  "sexo_id"
    t.integer  "tipo_servicio_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["sexo_id"], name: "index_sexo_tipo_servicios_on_sexo_id", using: :btree
    t.index ["tipo_servicio_id"], name: "index_sexo_tipo_servicios_on_tipo_servicio_id", using: :btree
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

  create_table "tipo_atenciones", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tipo_busquedas", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tipo_calificaciones", force: :cascade do |t|
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

  create_table "tipo_citas", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tipo_criterio", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tipo_criterios", force: :cascade do |t|
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

  create_table "tipo_evaluaciones", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tipo_eventos", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tipo_eventualidades", force: :cascade do |t|
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

  create_table "tipo_horarios", force: :cascade do |t|
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

  create_table "tipo_motivos", force: :cascade do |t|
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

  create_table "tipo_pagos", force: :cascade do |t|
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
    t.integer  "categoria_id"
    t.integer  "especialidad_id"
    t.integer  "tipo_atencion_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["categoria_id"], name: "index_tipo_servicios_on_categoria_id", using: :btree
    t.index ["especialidad_id"], name: "index_tipo_servicios_on_especialidad_id", using: :btree
    t.index ["tipo_atencion_id"], name: "index_tipo_servicios_on_tipo_atencion_id", using: :btree
  end

  create_table "tipo_ubicaciones", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "turnos", force: :cascade do |t|
    t.string   "descripcion"
    t.time     "hora_inicio"
    t.time     "hora_fin"
    t.integer  "estatus"
    t.integer  "cantidad_pacientes"
    t.integer  "dia_id"
    t.integer  "horario_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["dia_id"], name: "index_turnos_on_dia_id", using: :btree
    t.index ["horario_id"], name: "index_turnos_on_horario_id", using: :btree
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

  add_foreign_key "adiccion_tipo_servicios", "adicciones"
  add_foreign_key "adiccion_tipo_servicios", "tipo_servicios"
  add_foreign_key "adicciones", "tipo_adicciones"
  add_foreign_key "busquedas", "especialidades"
  add_foreign_key "busquedas", "especialistas"
  add_foreign_key "busquedas", "tipo_busquedas"
  add_foreign_key "busquedas", "tipo_servicios"
  add_foreign_key "calificaciones", "tipo_calificaciones"
  add_foreign_key "cirugia_tipo_servicios", "cirugias"
  add_foreign_key "cirugia_tipo_servicios", "tipo_servicios"
  add_foreign_key "cirugias", "tipo_cirugias"
  add_foreign_key "citas", "personas"
  add_foreign_key "citas", "tipo_citas"
  add_foreign_key "citas", "tipo_pagos"
  add_foreign_key "citas", "turnos"
  add_foreign_key "citas", "usuarios"
  add_foreign_key "ciudades", "estados"
  add_foreign_key "criterio_tipo_servicios", "criterios"
  add_foreign_key "criterio_tipo_servicios", "tipo_servicios"
  add_foreign_key "criterios", "tipo_criterios"
  add_foreign_key "discapacidad_tipo_servicios", "discapacidades"
  add_foreign_key "discapacidad_tipo_servicios", "tipo_servicios"
  add_foreign_key "discapacidades", "tipo_discapacidades"
  add_foreign_key "especialistas", "especialidades"
  add_foreign_key "estado_civil_tipo_servicios", "estado_civiles"
  add_foreign_key "estado_civil_tipo_servicios", "tipo_servicios"
  add_foreign_key "estados", "paises"
  add_foreign_key "evaluaciones", "tipo_evaluaciones"
  add_foreign_key "eventos", "tipo_eventos"
  add_foreign_key "eventualidades", "motivos"
  add_foreign_key "eventualidades", "tipo_eventualidades"
  add_foreign_key "grupo_sanguineo_tipo_servicios", "grupo_sanguineos"
  add_foreign_key "grupo_sanguineo_tipo_servicios", "tipo_servicios"
  add_foreign_key "habito_tipo_servicios", "habitos"
  add_foreign_key "habito_tipo_servicios", "tipo_servicios"
  add_foreign_key "habitos", "tipo_habitos"
  add_foreign_key "horarios", "tipo_horarios"
  add_foreign_key "lesion_tipo_servicios", "lesiones"
  add_foreign_key "lesion_tipo_servicios", "tipo_servicios"
  add_foreign_key "lesiones", "tipo_lesiones"
  add_foreign_key "motivos", "tipo_motivos"
  add_foreign_key "noticias", "tipo_noticias"
  add_foreign_key "ocupacion_tipo_servicios", "ocupaciones"
  add_foreign_key "ocupacion_tipo_servicios", "tipo_servicios"
  add_foreign_key "opiniones", "motivos"
  add_foreign_key "opiniones", "tipo_opiniones"
  add_foreign_key "option_roles", "option_menus"
  add_foreign_key "option_roles", "roles"
  add_foreign_key "patologia_tipo_servicios", "patologias"
  add_foreign_key "patologia_tipo_servicios", "tipo_servicios"
  add_foreign_key "patologias", "tipo_patologias"
  add_foreign_key "personas", "sexos"
  add_foreign_key "preguntas", "tipo_preguntas"
  add_foreign_key "profesion_tipo_servicios", "profesiones"
  add_foreign_key "profesion_tipo_servicios", "tipo_servicios"
  add_foreign_key "servicios", "especialistas"
  add_foreign_key "servicios", "tipo_servicios"
  add_foreign_key "servicios", "ubicaciones"
  add_foreign_key "sexo_tipo_servicios", "sexos"
  add_foreign_key "sexo_tipo_servicios", "tipo_servicios"
  add_foreign_key "tipo_servicio_vacunas", "tipo_servicios"
  add_foreign_key "tipo_servicio_vacunas", "vacunas"
  add_foreign_key "tipo_servicios", "categorias"
  add_foreign_key "tipo_servicios", "especialidades"
  add_foreign_key "tipo_servicios", "tipo_atenciones"
  add_foreign_key "turnos", "dias"
  add_foreign_key "turnos", "horarios"
  add_foreign_key "ubicaciones", "ciudades"
  add_foreign_key "ubicaciones", "sectores"
  add_foreign_key "ubicaciones", "tipo_ubicaciones"
  add_foreign_key "usuarios", "personas"
  add_foreign_key "usuarios", "roles"
end
