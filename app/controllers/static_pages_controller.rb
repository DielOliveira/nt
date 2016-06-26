class StaticPagesController < ApplicationController
before_action :requer_logon

	def home
	end	

	def faq
	end

	def wellcome
	end	
	
	def configu
	end

	def redeslist
		@cadastro_id = params[:cadastro_id]
	end	
	
end
