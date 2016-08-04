class CreateCadastros < ActiveRecord::Migration
  def change
    create_table :cadastros do |t|
      t.string :nomepessoa
      t.boolean :masculino
      t.string :email
      t.string :telefone
      t.references :operadora, index: true, foreign_key: true
      t.string :whatsapp
      t.string :skype
      t.string :facebook
      t.references :dadosfinanceiro, index: true, foreign_key: true
      t.datetime :dadatainclusao
      t.boolean :flagativo
      t.integer :contador

      t.timestamps null: false
    end
  end
end
