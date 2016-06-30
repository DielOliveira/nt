class CreateCiclos < ActiveRecord::Migration
  def change
    create_table :ciclos do |t|
      t.string :nomeciclo
      t.integer :numerociclo
      t.decimal :valorciclo
      t.integer :qtdreentradas

      t.timestamps null: false
    end
  end
end
