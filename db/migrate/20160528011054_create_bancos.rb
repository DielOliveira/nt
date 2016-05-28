class CreateBancos < ActiveRecord::Migration
  def change
    create_table :bancos do |t|
      t.string :nomebanco

      t.timestamps null: false
    end
  end
end
