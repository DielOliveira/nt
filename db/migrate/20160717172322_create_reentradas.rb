class CreateReentradas < ActiveRecord::Migration
  def change
    create_table :reentradas do |t|

      t.timestamps null: false
    end
  end
end
