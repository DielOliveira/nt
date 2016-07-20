#encoding: utf-8
class CreateBancos < ActiveRecord::Migration
  def change
    create_table :bancos do |t|
      t.string :nomebanco

      t.timestamps null: false
    end

    Contabancariatipo.create(:nomebanco => "Bradesco")
    Contabancariatipo.create(:nomebanco => "Itaú")
    Contabancariatipo.create(:nomebanco => "Caixa Econômica")
    Contabancariatipo.create(:nomebanco => "Santander")

  end
end
