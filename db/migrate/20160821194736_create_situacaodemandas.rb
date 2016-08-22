class CreateSituacaodemandas < ActiveRecord::Migration
  def change
    create_table :situacaodemandas do |t|
      t.string :descricao

      t.timestamps null: false
    end
  end
end
