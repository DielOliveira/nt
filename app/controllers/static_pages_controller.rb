	class StaticPagesController < ApplicationController
	#before_action :requer_logon

	def index

		if usuario_logado
			redirect_to home_path
		end
		
	end

	def retiralixo

		begin

		cadastros = Cadastro.joins('left join dadosfinanceiros df on df.cadastro_id = cadastros.id').where("df.id is null ")
		cadastros.each do |cadastro|

			redes = Rede.where(:cadastro_id => cadastro.id)
			redes.each do |rede|
				rede.cadastro_id = nil
				rede.save
			end
			cadastro.destroy
		end

		cadastros = Cadastro.joins('left join usuarios us on us.cadastro_id = cadastros.id').where("us.id is null ")
		cadastros.each do |cadastro|

			redes = Rede.where(:cadastro_id => cadastro.id)
			redes.each do |rede|
				rede.cadastro_id = nil
				rede.save
			end			
			cadastro.destroy
		end		

		dadosfinanceiros = Dadosfinanceiro.joins('left join cadastros cd on cd.id = cadastro_id').where("cadastro_id is null ")
		dadosfinanceiros.each do |dado|
			dado.destroy
		end

		usuarios = Usuario.joins('left join cadastros cd on cd.id = cadastro_id').where("cadastro_id is null")
		usuarios.each do |usuario|
			usuario.destroy
		end

		doacoes = Doacao.joins('left join cadastros cd on cd.id = cadastro_doador_id').where("cd.id is null")
		doacoes.each do |doacao|
			doacao.destroy
		end

		doacoes = Doacao.joins('left join cadastros cd on cd.id = cadastro_recebedor_id').where("cd.id is null")
		doacoes.each do |doacao|
			doacao.destroy
		end

		rescue
			flash[:notice] = "Erro ao realizar limpeza."
		end

		flash[:success] = "Limpeza efetuada com sucesso."
		redirect_to home_path

	end

	def validacadastro

		doacoes = Doacao.where('tempo < ? and flagconfirmada = false and flagpause <> true', Time.now)

		doacoes.each do |doacao|

				cadastro = Cadastro.find_by_id(doacao.cadastro_doador_id)
				
				rede = Rede.find_by_cadastro_id(cadastro.id)
				if not rede.blank?
					rede.cadastro_id = nil
					rede.save
				end

				reentradas = Reentrada.where(:cadastro_adicionado_id => cadastro.id)

				if not reentradas.blank?
					reentradas.first.destroy
				end

				indicado = Indicado.where(:cadastro_2_id => cadastro.id)

				if not indicado.blank?
					indicado.first.destroy
				end

				doacao.destroy

				cadastro.destroy

		end

	end	

	def verdoacoes

		    rede = Rede.where('cadastro_id = ? and ciclo_id = ?',user.cadastro.id, user.cadastro.ciclo_id).first
		
			if rede.linha > 2
				doacoes = Doacao.joins('inner join ciclos cl on cl.id = ciclo_doador_id').where("cadastro_doador_id = " + user.cadastro.id.to_s + "and ciclo_doador_id = " + user.cadastro.ciclo.id.to_s )
				if doacoes.empty?

					tempo = (user.cadastro.ciclo.id  == 1 ? 3 : 1)

				    start = Doacao.new
				    start.cadastro_doador_id = user.cadastro.id
				    start.cadastro_recebedor_id = rede.parent.parent.cadastro.id
				    start.cadastro_principal_id = user.cadastro.id
				    start.ciclo_doador_id = user.cadastro.ciclo.id
				    start.ciclo_recebedor_id = rede.parent.parent.cadastro.ciclo.id
				    start.flagenviada = false
				    start.flagconfirmada = false
				    start.tempo = (Time.now + tempo.days)
				    start.save			
				    	
				end			
			end

		    reentradas = Reentrada.where('cadastro_principal_id = ? ', user.cadastro.id.to_s)
		
			reentradas.each do |reentrada|
			#byebug

				rede = Rede.where('cadastro_id = ? and ciclo_id = ?', reentrada.cadastro_adicionado_id, reentrada.cadastro_adicionado.ciclo_id).first

				doacoes = Doacao.joins('inner join ciclos cl on cl.id = ciclo_doador_id').where("cadastro_doador_id = " + reentrada.cadastro_adicionado_id.to_s + "and ciclo_doador_id = " + reentrada.cadastro_adicionado.ciclo_id.to_s )
				if doacoes.empty?


				    start = Doacao.new
				    start.cadastro_doador_id = reentrada.cadastro_adicionado_id
				    start.cadastro_recebedor_id = rede.parent.parent.cadastro_id
				    start.cadastro_principal_id = user.cadastro_id
				    start.ciclo_doador_id = reentrada.cadastro_adicionado.ciclo_id
				    start.ciclo_recebedor_id = rede.parent.parent.cadastro.ciclo_id
				    start.flagenviada = false
				    start.flagconfirmada = false
				    start.tempo = (Time.now + 1.days)
				    start.save			
					    	
				end
			end		

		end

	def loginprincipal

        reset_session

        reentrada = Reentrada.find_by_cadastro_2_id(params[:cadastro_id])

        #byebug

        session[:ObjLogon] = Usuario.find_by_cadastro_id(reentrada.cadastro_1.id)


        if usuario_logado == true
          redirect_to root_path, notice: 'Usuario logado com sucesso.'
        else
           flash[:error] = "Usuario ou senha incorretos."
        end 

	end

	def home

		@doacaospendentesreceber = Doacao.where("cadastro_recebedor_id =" + user.cadastro.id.to_s + " and dataconfirmacao is null")
		@doacaospendentesreceberreentradas = Doacao.joins("inner join reentradas re on re.cadastro_adicionado_id = doacaos.cadastro_recebedor_id").where("re.cadastro_principal_id = " + user.cadastro.id.to_s + " and dataconfirmacao is null")
		
		@doacaospendentespagar = Doacao.where("cadastro_doador_id =" + user.cadastro.id.to_s + "and flagenviada = false and dataconfirmacao is null")
		@doacaospendentesreentradas = Doacao.joins("inner join reentradas re on re.cadastro_adicionado_id = doacaos.cadastro_doador_id").where("re.cadastro_principal_id = " + user.cadastro.id.to_s + "and flagenviada = false and dataconfirmacao is null")


		#Controle de mensagens
		@mensagem = Mensagem.where("cadastro_1_id =" + user.cadastro.id.to_s + "and datarecebimento is null")
		@mensagems = Mensagem.where(:cadastro_1_id => user.cadastro.id)

		#Contador de doações	
		@doacoesrecebidas = 0
		
		@doacaospendentesreceber.each do |d|	
			@doacoesrecebidas = @doacoesrecebidas + d.ciclo_doador.valorciclo
		end

		@doacaospendentesreceberreentradas.each do |d|	
			@doacoesrecebidas = @doacoesrecebidas + d.ciclo_doador.valorciclo
		end

		@indicados = Indicado.where('cadastro_1_id = ' + user.cadastro.id.to_s).count

		#validacadastro

		verdoacoes

	end	

	def faq
	end

	def wellcome
	end	
	
	def configu
	end

	def redeslistciclo

		@reentradas =  Reentrada.where('cadastro_reentrando_id = ? ', user.cadastro_id)


	end 
	
	def redeslist

		@rede = Rede.find_by_order(params[:rede_id]) rescue nil

		@redePrincipal = Rede.where('cadastro_id = ? and ciclo_id = ?', user.cadastro_id, @rede.first.ciclo_id ).first.id

		@ciclo = @rede.first.ciclo_id
		
		@cadastro_id = @rede.first.cadastro_id

		@cadastro = Cadastro.find_by_id(@cadastro_id)

		#Filhos
		@filho_primeiro = @rede.first.children.order(:id).first rescue nil
		@filho_primeiro_usuario = Usuario.find_by_cadastro_id(@filho_primeiro.cadastro.id) rescue nil

		@filho_segundo = @rede.first.children.order(:id).second rescue nil
		@filho_segundo_usuario = Usuario.find_by_cadastro_id(@filho_segundo.cadastro.id) rescue nil


		#Netos
		@neto_primeiro = @filho_primeiro.children.order(:id).first rescue nil
		@neto_primeiro_usuario = Usuario.find_by_cadastro_id(@neto_primeiro.cadastro.id) rescue nil
		
		@neto_segundo = @filho_primeiro.children.order(:id).second rescue nil
		@neto_segundo_usuario = Usuario.find_by_cadastro_id(@neto_segundo.cadastro.id) rescue nil
		
		@neto_terceiro = @filho_segundo.children.order(:id).first rescue nil
		@neto_terceiro_usuario = Usuario.find_by_cadastro_id(@neto_terceiro.cadastro.id) rescue nil
		
		@neto_quarto = @filho_segundo.children.order(:id).second rescue nil
		@neto_quarto_usuario = Usuario.find_by_cadastro_id(@neto_quarto.cadastro.id) rescue nil

		#Bisnetos
		@bisneto_primeiro = @neto_primeiro.children.order(:id).first rescue nil
		@bisneto_primeiro_usuario = Usuario.find_by_cadastro_id(@bisneto_primeiro.cadastro.id) rescue nil
		
		@bisneto_segundo = @neto_primeiro.children.order(:id).second rescue nil
		@bisneto_segundo_usuario = Usuario.find_by_cadastro_id(@bisneto_segundo.cadastro.id) rescue nil
		
		@bisneto_terceiro = @neto_segundo.children.order(:id).first rescue nil
		@bisneto_terceiro_usuario = Usuario.find_by_cadastro_id(@bisneto_terceiro.cadastro.id) rescue nil
		
		@bisneto_quarto = @neto_segundo.children.order(:id).second rescue nil
		@bisneto_quarto_usuario = Usuario.find_by_cadastro_id(@bisneto_quarto.cadastro.id) rescue nil
		
		@bisneto_quinto = @neto_terceiro.children.order(:id).first rescue nil
		@bisneto_quinto_usuario = Usuario.find_by_cadastro_id(@bisneto_quinto.cadastro.id) rescue nil
		
		@bisneto_sexto = @neto_terceiro.children.order(:id).second rescue nil
		@bisneto_sexto_usuario = Usuario.find_by_cadastro_id(@bisneto_sexto.cadastro.id) rescue nil
		
		@bisneto_setimo = @neto_quarto.children.order(:id).first rescue nil
		@bisneto_setimo_usuario = Usuario.find_by_cadastro_id(@bisneto_setimo.cadastro.id) rescue nil
		
		@bisneto_oitavo = @neto_quarto.children.order(:id).second rescue nil
		@bisneto_oitavo_usuario = Usuario.find_by_cadastro_id(@bisneto_oitavo.cadastro.id) rescue nil

	end	
	
end
