module Auntentication


	def usuario_logado
		if 	session[:ObjLogon] == nil || session[:ObjLogon] == ""
			return false
		else
			return true
		end
	end

	def requer_logon
		#debugger
		if 	usuario_logado == true
			return true
		else
			redirect_to root_path
		end
	end	

	def user
		#redirect_to :root if usuario_logado == false
		if usuario_logado == true
			return Usuario.find_by_id(session[:ObjLogon]["id"])
		end
	end

	def userfinan
		#redirect_to :root if usuario_logado == false
		if usuario_logado == true
			return Dadosfinanceiro.find_by_cadastro_id(user.cadastro_id)
		end
	end	

	def encerra_sessao
		reset_session
		redirect_to root_path
	end

end
