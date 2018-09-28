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

ActiveRecord::Schema.define(version: 2018_09_27_145355) do

  create_table "archivo_juegos", id: false, force: :cascade do |t|
    t.integer "tipo_juego_id", null: false
    t.integer "archivo_id", null: false
    t.integer "frase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["archivo_id"], name: "index_archivo_juegos_on_archivo_id"
    t.index ["frase_id"], name: "index_archivo_juegos_on_frase_id"
    t.index ["tipo_juego_id"], name: "index_archivo_juegos_on_tipo_juego_id"
  end

  create_table "archivos", force: :cascade do |t|
    t.string "nombre"
    t.string "tipo_archivo"
    t.string "nombre_archivo", null: false
    t.string "extension", null: false
    t.string "ruta_archivo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "aulas", force: :cascade do |t|
    t.integer "docente_programa_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["docente_programa_id"], name: "index_aulas_on_docente_programa_id"
  end

  create_table "docente_programas", id: false, force: :cascade do |t|
    t.integer "docente_id", null: false
    t.integer "programa_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["docente_id"], name: "index_docente_programas_on_docente_id"
    t.index ["programa_id"], name: "index_docente_programas_on_programa_id"
  end

  create_table "docentes", id: false, force: :cascade do |t|
    t.integer "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_docentes_on_usuario_id"
  end

  create_table "entradas", force: :cascade do |t|
    t.datetime "fecha_publicacion", null: false
    t.boolean "publicado", default: false, null: false
    t.boolean "abierto", default: false, null: false
    t.integer "ramificacion", default: 0, null: false
    t.integer "archivo_id", null: false
    t.integer "entrada_id", null: false
    t.integer "nivel_acceso_id", null: false
    t.integer "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["archivo_id"], name: "index_entradas_on_archivo_id"
    t.index ["entrada_id"], name: "index_entradas_on_entrada_id"
    t.index ["nivel_acceso_id"], name: "index_entradas_on_nivel_acceso_id"
    t.index ["usuario_id"], name: "index_entradas_on_usuario_id"
  end

  create_table "estudiante_aulas", id: false, force: :cascade do |t|
    t.integer "aula_id", null: false
    t.integer "estudiante_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aula_id"], name: "index_estudiante_aulas_on_aula_id"
    t.index ["estudiante_id"], name: "index_estudiante_aulas_on_estudiante_id"
  end

  create_table "estudiantes", id: false, force: :cascade do |t|
    t.integer "usuario_id", null: false
    t.integer "tutor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tutor_id"], name: "index_estudiantes_on_tutor_id"
    t.index ["usuario_id"], name: "index_estudiantes_on_usuario_id"
  end

  create_table "frase_pnls", force: :cascade do |t|
    t.string "frase", null: false
    t.integer "tipo_usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tipo_usuario_id"], name: "index_frase_pnls_on_tipo_usuario_id"
  end

  create_table "frases", force: :cascade do |t|
    t.string "frase", null: false
    t.integer "leccion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["leccion_id"], name: "index_frases_on_leccion_id"
  end

  create_table "leccions", force: :cascade do |t|
    t.integer "semana", null: false
    t.integer "programa_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["programa_id"], name: "index_leccions_on_programa_id"
  end

  create_table "nivel_accesos", force: :cascade do |t|
    t.string "nombre", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programas", force: :cascade do |t|
    t.string "nombre", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "progresos", id: false, force: :cascade do |t|
    t.integer "repeticion_completada", default: 0, null: false
    t.integer "estudiante_id", null: false
    t.integer "leccion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estudiante_id"], name: "index_progresos_on_estudiante_id"
    t.index ["leccion_id"], name: "index_progresos_on_leccion_id"
  end

  create_table "puntuacions", id: false, force: :cascade do |t|
    t.date "fecha", null: false
    t.integer "puntuacion_obtenida", null: false
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
    t.date "fecha", null: false
    t.integer "usuario_id", null: false
    t.integer "tipo_actividad_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tipo_actividad_id"], name: "index_registro_actividads_on_tipo_actividad_id"
    t.index ["usuario_id"], name: "index_registro_actividads_on_usuario_id"
  end

  create_table "tipo_actividads", force: :cascade do |t|
    t.string "nombre", null: false
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_juegos", force: :cascade do |t|
    t.string "nombre_juego", null: false
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_usuarios", force: :cascade do |t|
    t.string "nombre", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tutors", id: false, force: :cascade do |t|
    t.integer "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_tutors_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "user", null: false
    t.string "password", null: false
    t.string "nombre", null: false
    t.string "correo", null: false
    t.date "fecha_nacimiento"
    t.date "fecha_registro", null: false
    t.integer "tipo_usuario_id", null: false
    t.integer "archivo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["archivo_id"], name: "index_usuarios_on_archivo_id"
    t.index ["tipo_usuario_id"], name: "index_usuarios_on_tipo_usuario_id"
  end

end
