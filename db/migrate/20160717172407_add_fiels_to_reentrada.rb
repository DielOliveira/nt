class AddFielsToReentrada < ActiveRecord::Migration
  def change
    add_column :reentradas, :cadastro_1_id, :integer
    add_column :reentradas, :cadastro_2_id, :integer   	
  end
end
