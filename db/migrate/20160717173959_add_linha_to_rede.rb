class AddLinhaToRede < ActiveRecord::Migration
  def change
    add_column :redes, :linha, :integer

	Rede.create(:linha => 1)    
	
  end
end
