#encoding: utf-8
class CreateContabancariatipos < ActiveRecord::Migration
  def change
    create_table :contabancariatipos do |t|
      t.string :nometipo

      t.timestamps null: false
    end

    #Contabancariatipo.create(:nometipo => "Corrente")
    #Contabancariatipo.create(:nometipo => "Poupança")

  end
end
