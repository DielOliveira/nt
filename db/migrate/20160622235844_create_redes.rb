class CreateRedes < ActiveRecord::Migration
  def change
    create_table :redes do |t|
      t.string :desc
      t.references :redetipo, index: true, foreign_key: true
      t.references :usuario, index: true, foreign_key: true
      t.integer :parent_id

      t.timestamps null: false
    end

  end
end
