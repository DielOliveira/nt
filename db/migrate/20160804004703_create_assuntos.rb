#encoding: utf-8
class CreateAssuntos < ActiveRecord::Migration
  def change
    create_table :assuntos do |t|
      t.string :assunto

      t.timestamps null: false
    end

      Assunto.create(:assunto => "Diversos")
      Assunto.create(:assunto => "Compra e Venda de Logins")
      Assunto.create(:assunto => "Recuperar Senha e Dados")
  end
end
