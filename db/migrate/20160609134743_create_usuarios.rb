class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :email
      t.string :senha
      t.references :cadastro, index: true, foreign_key: true
      t.date :datainclusao
      t.date :dataultimologin
      t.boolean :flagativo

      t.timestamps null: false
    end
  end
end
