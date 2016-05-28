class CreateTipoconta < ActiveRecord::Migration
  def change
    create_table :tipoconta do |t|
      t.string :nometipo

      t.timestamps null: false
    end
  end
end
