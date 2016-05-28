class CreateOperadoras < ActiveRecord::Migration
  def change
    create_table :operadoras do |t|
      t.string :nomeoperadora

      t.timestamps null: false
    end
  end
end
