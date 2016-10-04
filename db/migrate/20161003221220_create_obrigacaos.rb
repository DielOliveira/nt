class CreateObrigacaos < ActiveRecord::Migration
  def change
    create_table :obrigacaos do |t|
      t.references :cadastro, index: true, foreign_key: true
      t.boolean :flagrealizado

      t.timestamps null: false
    end
  end
end
