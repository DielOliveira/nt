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

ActiveRecord::Schema.define(version: 20160528145024) do

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
    t.integer  "dadosfinanceiro_id"
    t.datetime "dadatainclusao"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "cadastros", ["dadosfinanceiro_id"], name: "index_cadastros_on_dadosfinanceiro_id", using: :btree
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
  end

  add_index "dadosfinanceiros", ["banco_id"], name: "index_dadosfinanceiros_on_banco_id", using: :btree
  add_index "dadosfinanceiros", ["contabancariatipo_id"], name: "index_dadosfinanceiros_on_contabancariatipo_id", using: :btree

  create_table "operadoras", force: :cascade do |t|
    t.string   "nomeoperadora"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_foreign_key "cadastros", "dadosfinanceiros"
  add_foreign_key "cadastros", "operadoras"
  add_foreign_key "dadosfinanceiros", "bancos"
  add_foreign_key "dadosfinanceiros", "contabancariatipos"
end
