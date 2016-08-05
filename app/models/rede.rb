class Rede < ActiveRecord::Base
	extend ActsAsTree::TreeView
	extend ActsAsTree::TreeWalker

	  acts_as_tree order: 'rank'
	  acts_as_tree
	
	  belongs_to :redetipo
	  belongs_to :cadastro
	  belongs_to :ciclo
	  

def self.find_by_order(rede_id)      
	Rede.where('id = ?', rede_id).order('created_at')
end



end
