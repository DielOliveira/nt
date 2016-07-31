class Rede < ActiveRecord::Base
	extend ActsAsTree::TreeView
	extend ActsAsTree::TreeWalker

	  acts_as_tree order: 'rank'
	  acts_as_tree
	
	  belongs_to :redetipo
	  belongs_to :cadastro
	  

def self.find_by_order(cadastro_id)      
	Rede.where('cadastro_id = ? ', cadastro_id).order('created_at')
end



end
