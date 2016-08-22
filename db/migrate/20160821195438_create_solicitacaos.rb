class CreateSolicitacaos < ActiveRecord::Migration
  def change
    create_table :solicitacaos do |t|
      t.string :titulo
      t.string :descricao
      t.references :situacaodemanda, index: true, foreign_key: true
      t.datetime :dataprevisao
      t.string :anexo
      t.string :resolucao

      t.timestamps null: false
    end
  end
end
