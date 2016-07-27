class CreateReentradas < ActiveRecord::Migration
  def change
    create_table :reentradas do |t|
	t.references :ciclo, index: true, foreign_key: true
    t.timestamps null: false
    end
  end
end
