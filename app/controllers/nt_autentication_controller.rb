class NtAutenticationController < ApplicationController

	def forgot

		if request.post?

			cadastro = Cadastro.where('ltrim(rtrim(email)) = ?',params[:email].strip )
			if not cadastro.first.blank? 
			
				usuario = Usuario.find_by_cadastro_id(cadastro.first.id)
				parametro = {"name" => cadastro.first.nomepessoa,
							 "email" => cadastro.first.email,
							 "subject" => "Recuperação de Senha",
							 "message" => "Login: " + usuario.email + " Senha: " + usuario.senha}

				enviarEmail(parametro)
			else
				flash[:success] = 'E-mail não encontrado na base de dados. Certifique-se de que escreveu corretamente.'
			end
		end

	end

		
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
					redirect_to home_path, notice: 'Usuario logado com sucesso.'
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
