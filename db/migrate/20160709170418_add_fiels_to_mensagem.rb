class AddFielsToMensagem < ActiveRecord::Migration
  def change
    add_column :mensagems, :cadastro_1_id, :integer
    add_column :mensagems, :cadastro_2_id, :integer  	  	
  end
end
