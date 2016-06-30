class CreateDoacaos < ActiveRecord::Migration
  def change
    create_table :doacaos do |t|
      t.references :ciclo, index: true, foreign_key: true
      t.boolean :flagconfirmada
      t.boolean :flagrejeitada

      t.timestamps null: false
    end
  end
end
