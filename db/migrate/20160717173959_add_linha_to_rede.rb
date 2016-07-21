class AddLinhaToRede < ActiveRecord::Migration
  def change
    add_column :redes, :linha, :integer    
	
  end
end
