class CreateIndicados < ActiveRecord::Migration
  def change
    create_table :indicados do |t|

      t.timestamps null: false
    end
  end
end
