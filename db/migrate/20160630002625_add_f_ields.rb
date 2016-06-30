class AddFIelds < ActiveRecord::Migration
  def change
    add_column :doacaos, :cadastro_1_id, :integer
    add_column :doacaos, :cadastro_2_id, :integer  	
  end
end
