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

ActiveRecord::Schema.define(version: 20161115122428) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assuntos", force: :cascade do |t|
    t.string   "assunto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.boolean  "flagativo"
    t.integer  "contador"
    t.boolean  "flagreentradaobrigatoria"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "cpf"
    t.integer  "ciclo_id"
    t.string   "avatar"
    t.boolean  "flagreentrada"
  end

  add_index "cadastros", ["ciclo_id"], name: "index_cadastros_on_ciclo_id", using: :btree
  add_index "cadastros", ["operadora_id"], name: "index_cadastros_on_operadora_id", using: :btree

  create_table "ciclos", force: :cascade do |t|
    t.string   "nomeciclo"
    t.integer  "numerociclo"
    t.decimal  "valorciclo"
    t.integer  "qtdreentradas"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "qtdreentradasparareentradas"
  end

  create_table "contabancariatipos", force: :cascade do |t|
    t.string   "nometipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contatos", force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.integer  "assunto_id"
    t.string   "mensagem"
    t.boolean  "respondida"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contatos", ["assunto_id"], name: "index_contatos_on_assunto_id", using: :btree

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
    t.string   "contapicpay"
  end

  add_index "dadosfinanceiros", ["banco_id"], name: "index_dadosfinanceiros_on_banco_id", using: :btree
  add_index "dadosfinanceiros", ["cadastro_id"], name: "index_dadosfinanceiros_on_cadastro_id", using: :btree
  add_index "dadosfinanceiros", ["contabancariatipo_id"], name: "index_dadosfinanceiros_on_contabancariatipo_id", using: :btree

  create_table "doacaos", force: :cascade do |t|
    t.string   "comprovante"
    t.boolean  "flagconfirmada"
    t.boolean  "flagrejeitada"
    t.datetime "tempo"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "cadastro_doador_id"
    t.integer  "cadastro_recebedor_id"
    t.integer  "cadastro_principal_id"
    t.integer  "ciclo_doador_id"
    t.integer  "ciclo_recebedor_id"
    t.datetime "dataconfirmacao"
    t.string   "observacao"
    t.boolean  "flagenviada"
    t.string   "avatar"
    t.boolean  "flagpause"
  end

  create_table "indicados", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "cadastro_1_id"
    t.integer  "cadastro_2_id"
  end

  create_table "mensagems", force: :cascade do |t|
    t.datetime "datarecebimento"
    t.string   "mensagem"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "cadastro_1_id"
    t.integer  "cadastro_2_id"
  end

  create_table "obrigacaos", force: :cascade do |t|
    t.integer  "cadastro_id"
    t.boolean  "flagrealizado"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "cadastro_adicionado_id"
  end

  add_index "obrigacaos", ["cadastro_id"], name: "index_obrigacaos_on_cadastro_id", using: :btree

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
    t.integer  "linha"
    t.integer  "ciclo_id"
    t.integer  "ordem"
  end

  add_index "redes", ["cadastro_id"], name: "index_redes_on_cadastro_id", using: :btree
  add_index "redes", ["ciclo_id"], name: "index_redes_on_ciclo_id", using: :btree
  add_index "redes", ["redetipo_id"], name: "index_redes_on_redetipo_id", using: :btree

  create_table "redetipos", force: :cascade do |t|
    t.boolean  "reentradaobrigatoria"
    t.integer  "reentradas"
    t.boolean  "ordenada"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "reentradas", force: :cascade do |t|
    t.integer  "ciclo_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "cadastro_reentrando_id"
    t.integer  "cadastro_adicionado_id"
    t.integer  "cadastro_principal_id"
    t.boolean  "flagopcional"
  end

  add_index "reentradas", ["ciclo_id"], name: "index_reentradas_on_ciclo_id", using: :btree

  create_table "situacaodemandas", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "solicitacaos", force: :cascade do |t|
    t.string   "titulo"
    t.string   "descricao"
    t.integer  "situacaodemanda_id"
    t.datetime "dataprevisao"
    t.string   "anexo"
    t.string   "resolucao"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "solicitacaos", ["situacaodemanda_id"], name: "index_solicitacaos_on_situacaodemanda_id", using: :btree

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

  add_foreign_key "cadastros", "ciclos"
  add_foreign_key "cadastros", "operadoras"
  add_foreign_key "contatos", "assuntos"
  add_foreign_key "dadosfinanceiros", "bancos"
  add_foreign_key "dadosfinanceiros", "cadastros"
  add_foreign_key "dadosfinanceiros", "contabancariatipos"
  add_foreign_key "obrigacaos", "cadastros"
  add_foreign_key "redes", "cadastros"
  add_foreign_key "redes", "ciclos"
  add_foreign_key "redes", "redetipos"
  add_foreign_key "reentradas", "ciclos"
  add_foreign_key "solicitacaos", "situacaodemandas"
  add_foreign_key "usuarios", "cadastros"
end
