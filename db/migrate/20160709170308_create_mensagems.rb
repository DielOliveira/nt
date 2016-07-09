class CreateMensagems < ActiveRecord::Migration
  def change
    create_table :mensagems do |t|
      t.datetime :datarecebimento
      t.string :mensagem

      t.timestamps null: false
    end
  end
end
