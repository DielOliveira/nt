class CreateRedetipos < ActiveRecord::Migration
  def change
    create_table :redetipos do |t|
      t.boolean :reentradaobrigatoria
      t.integer :reentradas
      t.boolean :ordenada

      t.timestamps null: false
    end
  end
end
