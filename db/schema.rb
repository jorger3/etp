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

ActiveRecord::Schema.define(version: 20161109160227) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "factor_edads", force: :cascade do |t|
    t.integer  "codigo_tabla"
    t.integer  "grupo_edad_min"
    t.integer  "grupo_edad_max"
    t.float    "cotizante_hombre"
    t.float    "cotizante_mujer"
    t.float    "carga_hombre"
    t.float    "carga_mujer"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "factoredads", force: :cascade do |t|
    t.string   "codigo_tabla"
    t.integer  "grupo_edad_min"
    t.integer  "grupo_edad_max"
    t.float    "cotizante_hombre"
    t.float    "cotizante_mujer"
    t.float    "carga_hombre"
    t.float    "carga_mujer"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "plan_id"
    t.index ["codigo_tabla"], name: "index_factoredads_on_plan_id", using: :btree
  end

  create_table "plans", force: :cascade do |t|
    t.datetime "ano_mes_info"
    t.integer  "codigo_isapre"
    t.string   "nombre_isapre"
    t.string   "id_plan"
    t.string   "nombre_plan"
    t.string   "id_linea_plan"
    t.datetime "ano_mes_inicio_plan"
    t.string   "grupo_objetivo"
    t.string   "sexo"
    t.string   "grupo_socio_eco"
    t.string   "comercializacion"
    t.string   "region"
    t.string   "tipo_plan"
    t.string   "modalidad_atencion"
    t.string   "amplitud_cobertura"
    t.string   "prestaciones_restringidas"
    t.string   "edad"
    t.string   "modalidad_precio_plan"
    t.float    "precio_base_plan"
    t.string   "codigo_tabla_factores"
    t.datetime "ano_mes_ult_adecuacion"
    t.string   "tipo_adecuacion"
    t.float    "variacion_precio_base"
    t.string   "aplicacion_variacion"
    t.float    "reajuste_contractual_anual"
    t.datetime "ano_mes_reajuste_contractual"
    t.integer  "precio_base_final"
    t.string   "nombre_Arancel"
    t.string   "modalidad_arancel"
    t.integer  "bonificacion_prestaciones_ambulatorias"
    t.integer  "bonificacion_prestaciones_hospitalarias"
    t.string   "copago_fijo"
    t.string   "modalidad_tope"
    t.float    "tope_anual"
    t.integer  "cotizantes_vigentes"
    t.integer  "cargas_vigentes"
    t.string   "cobertura_reducida"
    t.string   "medico_cabecera"
    t.string   "administrador_plan"
    t.string   "sistema_pago_capitado"
    t.string   "marca_adecuacion"
    t.float    "ges"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["codigo_tabla_factores"], name: "index_plans_on_codigo_tabla_factores", using: :btree
  end

  create_table "tests", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "type"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "factoredads", "plans"
end
