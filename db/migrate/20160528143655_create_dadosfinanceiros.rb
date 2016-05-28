class CreateDadosfinanceiros < ActiveRecord::Migration
  def change
    create_table :dadosfinanceiros do |t|
      t.string :nometitular
      t.string :cpftitular
      t.references :banco, index: true, foreign_key: true
      t.string :agencia
      t.string :codigo
      t.string :operacao
      t.references :contabancariatipo, index: true, foreign_key: true
      t.string :observacao
      t.string :emailsuperconta
      t.date :datainclulsao

      t.timestamps null: false
    end
  end
end
