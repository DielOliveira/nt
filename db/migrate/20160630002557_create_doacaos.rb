class CreateDoacaos < ActiveRecord::Migration
  def change
    create_table :doacaos do |t|
      t.string :comprovante
      t.boolean :flagconfirmada
      t.boolean :flagrejeitada

      t.timestamps null: false
    end
  end
end
