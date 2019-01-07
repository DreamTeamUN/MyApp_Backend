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

ActiveRecord::Schema.define(version: 2019_01_07_203959) do

  create_table "archivo_juegos", force: :cascade do |t|
    t.integer "tipo_juego_id", null: false
    t.integer "archivo_id", null: false
    t.integer "frase_id"
    t.index ["archivo_id", "frase_id", "tipo_juego_id"], name: "archivo_frase_tipo_index", unique: true
    t.index ["archivo_id"], name: "index_archivo_juegos_on_archivo_id"
    t.index ["frase_id"], name: "index_archivo_juegos_on_frase_id"
    t.index ["tipo_juego_id"], name: "index_archivo_juegos_on_tipo_juego_id"
  end

  create_table "archivos", force: :cascade do |t|
    t.string "nombre", null: false
    t.string "tipo_archivo", default: "archivo", null: false
    t.string "extension", null: false
    t.string "ruta", null: false
  end

  create_table "aulas", force: :cascade do |t|
    t.integer "docente_id"
    t.integer "programa_id"
    t.string "nombre"
    t.string "descripcion", default: ""
    t.index ["docente_id"], name: "index_aulas_on_docente_id"
    t.index ["nombre"], name: "index_aulas_on_nombre", unique: true
    t.index ["programa_id"], name: "index_aulas_on_programa_id"
  end

  create_table "docente_programas", force: :cascade do |t|
    t.integer "docente_id", null: false
    t.integer "programa_id", null: false
    t.index ["docente_id", "programa_id"], name: "index_docente_programas_on_docente_id_and_programa_id", unique: true
    t.index ["docente_id"], name: "index_docente_programas_on_docente_id"
    t.index ["programa_id"], name: "index_docente_programas_on_programa_id"
  end

  create_table "docentes", force: :cascade do |t|
    t.integer "usuario_id", null: false
    t.index ["usuario_id"], name: "index_docentes_on_usuario_id"
  end

  create_table "entradas", force: :cascade do |t|
    t.boolean "publicado", default: false, null: false
    t.boolean "abierto", default: false, null: false
    t.integer "ramificacion", default: 0, null: false
    t.integer "entrada_id"
    t.integer "nivel_acceso_id", null: false
    t.integer "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "titulo"
    t.string "resumen", default: ""
    t.string "texto", default: ""
    t.boolean "oculta", default: false
    t.index ["created_at"], name: "index_entradas_on_created_at"
    t.index ["entrada_id"], name: "index_entradas_on_entrada_id"
    t.index ["nivel_acceso_id"], name: "index_entradas_on_nivel_acceso_id"
    t.index ["updated_at"], name: "index_entradas_on_updated_at"
    t.index ["usuario_id"], name: "index_entradas_on_usuario_id"
  end

  create_table "estudiante_aulas", force: :cascade do |t|
    t.integer "aula_id", null: false
    t.integer "estudiante_id", null: false
    t.index ["aula_id", "estudiante_id"], name: "index_estudiante_aulas_on_aula_id_and_estudiante_id", unique: true
    t.index ["aula_id"], name: "index_estudiante_aulas_on_aula_id"
    t.index ["estudiante_id"], name: "index_estudiante_aulas_on_estudiante_id"
  end

  create_table "estudiantes", force: :cascade do |t|
    t.integer "tutor_id", null: false
    t.string "nombre"
    t.date "fecha_nacimiento"
    t.integer "archivo_id", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["archivo_id"], name: "index_estudiantes_on_archivo_id"
    t.index ["tutor_id"], name: "index_estudiantes_on_tutor_id"
  end

  create_table "frase_pnls", force: :cascade do |t|
    t.string "frase", null: false
    t.integer "tipo_usuario_id"
    t.index ["tipo_usuario_id"], name: "index_frase_pnls_on_tipo_usuario_id"
  end

  create_table "frases", force: :cascade do |t|
    t.string "frase", null: false
    t.integer "leccion_id", null: false
    t.index ["leccion_id"], name: "index_frases_on_leccion_id"
  end

  create_table "leccions", force: :cascade do |t|
    t.integer "semana", default: 1, null: false
    t.integer "programa_id", null: false
    t.index ["programa_id"], name: "index_leccions_on_programa_id"
  end

  create_table "nivel_accesos", force: :cascade do |t|
    t.string "nombre", null: false
  end

  create_table "programas", force: :cascade do |t|
    t.string "nombre", null: false
  end

  create_table "progresos", force: :cascade do |t|
    t.integer "repeticion_completada", default: 0, null: false
    t.integer "estudiante_id", null: false
    t.integer "leccion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estudiante_id"], name: "index_progresos_on_estudiante_id"
    t.index ["leccion_id"], name: "index_progresos_on_leccion_id"
  end

  create_table "puntuacions", force: :cascade do |t|
    t.integer "puntuacion_obtenida", default: 0, null: false
    t.integer "tipo_juego_id", null: false
    t.integer "estudiante_id", null: false
    t.integer "leccion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estudiante_id"], name: "index_puntuacions_on_estudiante_id"
    t.index ["leccion_id"], name: "index_puntuacions_on_leccion_id"
    t.index ["tipo_juego_id"], name: "index_puntuacions_on_tipo_juego_id"
  end

  create_table "registro_actividads", force: :cascade do |t|
    t.integer "usuario_id", null: false
    t.integer "tipo_actividad_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ip_origen"
    t.index ["tipo_actividad_id"], name: "index_registro_actividads_on_tipo_actividad_id"
    t.index ["usuario_id"], name: "index_registro_actividads_on_usuario_id"
  end

  create_table "tipo_actividads", force: :cascade do |t|
    t.string "nombre", null: false
    t.string "descripcion"
  end

  create_table "tipo_juegos", force: :cascade do |t|
    t.string "nombre", null: false
    t.text "descripcion"
  end

  create_table "tipo_usuarios", force: :cascade do |t|
    t.string "nombre", null: false
  end

  create_table "tutors", force: :cascade do |t|
    t.integer "usuario_id", null: false
    t.index ["usuario_id"], name: "index_tutors_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "user", null: false
    t.string "password_digest", null: false
    t.string "nombre", null: false
    t.string "email", null: false
    t.date "fecha_nacimiento"
    t.integer "tipo_usuario_id", null: false
    t.integer "archivo_id", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "last_login"
    t.index ["archivo_id"], name: "index_usuarios_on_archivo_id"
    t.index ["tipo_usuario_id"], name: "index_usuarios_on_tipo_usuario_id"
  end

end
