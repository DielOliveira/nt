class Rede < ActiveRecord::Base
	extend ActsAsTree::TreeView
	extend ActsAsTree::TreeWalker

	  acts_as_tree order: 'rank'
	  acts_as_tree
	
	  belongs_to :redetipo
	  belongs_to :usuario


end
