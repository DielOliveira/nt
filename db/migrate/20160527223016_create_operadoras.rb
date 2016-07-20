#encoding: utf-8
class CreateOperadoras < ActiveRecord::Migration
  def change
    create_table :operadoras do |t|
      t.string :nomeoperadora

      t.timestamps null: false
    end

    Operadora.create(:nomeoperadora => "Oi")
    Operadora.create(:nomeoperadora => "Claro")
    Operadora.create(:nomeoperadora => "Tim")
    Operadora.create(:nomeoperadora => "Vivo")

  end
end
