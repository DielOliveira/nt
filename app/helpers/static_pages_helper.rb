module StaticPagesHelper

	def title(page_title)
	  content_for :title, page_title.to_s
	end

	def painel(page_title)
	  content_for :painel, page_title.to_s
	end

end
