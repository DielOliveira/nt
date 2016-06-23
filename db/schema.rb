# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160623020300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bancos", force: :cascade do |t|
    t.string   "nomebanco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cadastros", force: :cascade do |t|
    t.string   "nomepessoa"
    t.boolean  "masculino"
    t.string   "email"
    t.string   "telefone"
    t.integer  "operadora_id"
    t.string   "whatsapp"
    t.string   "skype"
    t.string   "facebook"
    t.datetime "dadatainclusao"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "cpf"
  end

  add_index "cadastros", ["operadora_id"], name: "index_cadastros_on_operadora_id", using: :btree

  create_table "contabancariatipos", force: :cascade do |t|
    t.string   "nometipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dadosfinanceiros", force: :cascade do |t|
    t.string   "nometitular"
    t.string   "cpftitular"
    t.integer  "banco_id"
    t.string   "agencia"
    t.string   "codigo"
    t.string   "operacao"
    t.integer  "contabancariatipo_id"
    t.string   "observacao"
    t.string   "emailsuperconta"
    t.date     "datainclulsao"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "cadastro_id"
  end

  add_index "dadosfinanceiros", ["banco_id"], name: "index_dadosfinanceiros_on_banco_id", using: :btree
  add_index "dadosfinanceiros", ["cadastro_id"], name: "index_dadosfinanceiros_on_cadastro_id", using: :btree
  add_index "dadosfinanceiros", ["contabancariatipo_id"], name: "index_dadosfinanceiros_on_contabancariatipo_id", using: :btree

  create_table "operadoras", force: :cascade do |t|
    t.string   "nomeoperadora"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "redes", force: :cascade do |t|
    t.string   "desc"
    t.integer  "redetipo_id"
    t.integer  "parent_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "cadastro_id"
  end

  add_index "redes", ["cadastro_id"], name: "index_redes_on_cadastro_id", using: :btree
  add_index "redes", ["redetipo_id"], name: "index_redes_on_redetipo_id", using: :btree

  create_table "redetipos", force: :cascade do |t|
    t.boolean  "reentradaobrigatoria"
    t.integer  "reentradas"
    t.boolean  "ordenada"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email"
    t.string   "senha"
    t.integer  "cadastro_id"
    t.date     "datainclusao"
    t.date     "dataultimologin"
    t.boolean  "flagativo"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "usuarios", ["cadastro_id"], name: "index_usuarios_on_cadastro_id", using: :btree

  add_foreign_key "cadastros", "operadoras"
  add_foreign_key "dadosfinanceiros", "bancos"
  add_foreign_key "dadosfinanceiros", "cadastros"
  add_foreign_key "dadosfinanceiros", "contabancariatipos"
  add_foreign_key "redes", "cadastros"
  add_foreign_key "redes", "redetipos"
  add_foreign_key "usuarios", "cadastros"
end
