class CreateAssuntos < ActiveRecord::Migration
  def change
    create_table :assuntos do |t|
      t.string :assunto

      t.timestamps null: false
    end
  end
end
