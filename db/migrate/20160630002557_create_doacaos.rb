class CreateDoacaos < ActiveRecord::Migration
  def change
    create_table :doacaos do |t|
      t.string :comprovante
      t.boolean :flagconfirmada
      t.boolean :flagrejeitada
      t.datetime :tempo

      t.timestamps null: false
    end
  end
end
