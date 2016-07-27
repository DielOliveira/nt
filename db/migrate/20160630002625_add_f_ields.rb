class AddFIelds < ActiveRecord::Migration
  def change
    add_column :doacaos, :cadastro_doador_id, :integer
    add_column :doacaos, :cadastro_recebedor_id, :integer  	
    add_column :doacaos, :cadastro_principal_id, :integer  	
    
    add_column :doacaos, :ciclo_doador_id, :integer  	
    add_column :doacaos, :ciclo_recebedor_id, :integer  	
  end
end
