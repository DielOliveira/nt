class CreateCiclos < ActiveRecord::Migration
  def change
    create_table :ciclos do |t|
      t.string :nomeciclo
      t.integer :numerociclo
      t.decimal :valorciclo
      t.integer :qtdreentradas

      t.timestamps null: false
    end

	Ciclo.create(:nomeciclo => "1", :numerociclo => 1, :valorciclo => 30.0, :qtdreentradas => 1)    
	Ciclo.create(:nomeciclo => "2", :numerociclo => 2, :valorciclo => 60.0, :qtdreentradas => 1)    
	Ciclo.create(:nomeciclo => "3", :numerociclo => 3, :valorciclo => 90.0, :qtdreentradas => 3)    
	Ciclo.create(:nomeciclo => "4", :numerociclo => 4, :valorciclo => 300.0, :qtdreentradas => 10)    
	Ciclo.create(:nomeciclo => "5", :numerociclo => 5, :valorciclo => 600.0, :qtdreentradas => 20)    
	Ciclo.create(:nomeciclo => "6", :numerociclo => 6, :valorciclo => 1500.0, :qtdreentradas => 50)    

  end
end
