class NtAutenticationController < ApplicationController


	def login

		#debugger
		if request.post?

			#debugger

			if params[:desc_login] == "" && params[:desc_senha] == ""
				flash[:error] = "Favor informar usuario e senha."
				return
			else

				session[:ObjLogon] = Usuario.where(:email => params[:desc_login], :senha => params[:desc_senha]) rescue nil
				session[:ObjLogon] = session[:ObjLogon].first

				if usuario_logado == true
					redirect_to root_path, notice: 'Usuario logado com sucesso.'
				else
					 flash[:error] = "Usuario ou senha incorretos."
				end
			
			end

		end
	end

	def logoff
		encerra_sessao
	end

end
