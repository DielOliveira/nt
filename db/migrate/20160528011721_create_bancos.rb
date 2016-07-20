#encoding: utf-8
class CreateBancos < ActiveRecord::Migration
  def change
    create_table :bancos do |t|
      t.string :nomebanco

      t.timestamps null: false
    end

    Banco.create(:nomebanco => "Bradesco")
    Banco.create(:nomebanco => "Itaú")
    Banco.create(:nomebanco => "Caixa Econômica")
    Banco.create(:nomebanco => "Santander")

  end
end
