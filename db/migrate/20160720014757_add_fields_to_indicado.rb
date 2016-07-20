class AddFieldsToIndicado < ActiveRecord::Migration
  def change
    add_column :indicados, :cadastro_1_id, :integer
    add_column :indicados, :cadastro_2_id, :integer  	  	
  end
end
