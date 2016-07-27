class AddFielsToReentrada < ActiveRecord::Migration
  def change
    add_column :reentradas, :cadastro_reentrando_id, :integer
    add_column :reentradas, :cadastro_adicionado_id, :integer   	
    add_column :reentradas, :cadastro_principal_id, :integer   	
  end
end
