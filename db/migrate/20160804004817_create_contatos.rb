class CreateContatos < ActiveRecord::Migration
  def change
    create_table :contatos do |t|
      t.string :nome
      t.string :email
      t.references :assunto, index: true, foreign_key: true
      t.string :mensagem
      t.boolean :respondida

      t.timestamps null: false
    end
  end
end
