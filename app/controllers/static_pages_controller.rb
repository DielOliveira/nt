class StaticPagesController < ApplicationController
before_action :requer_logon

	def verdoacoes

		    rede = Rede.find_by_cadastro_id(user.cadastro.id)
		
			if rede.linha > 2
				doacoes = Doacao.joins('inner join ciclos cl on cl.id = ciclo_doador_id').where("cadastro_doador_id = " + user.cadastro.id.to_s + "and ciclo_doador_id = " + user.cadastro.ciclo.id.to_s )
				if doacoes.empty?

				    start = Doacao.new
				    start.cadastro_doador_id = user.cadastro.id
				    start.cadastro_recebedor_id = rede.parent.parent.cadastro.id
				    start.cadastro_principal_id = user.cadastro.id
				    start.ciclo_doador_id = user.cadastro.ciclo.id
				    start.ciclo_recebedor_id = rede.parent.parent.cadastro.ciclo.id
				    start.flagenviada = false
				    start.save			
				    	
				end			
			end

		    redes = Rede.joins('inner join reentradas ree on cadastro_id = ree.cadastro_adicionado_id').where('cadastro_principal_id = ' + user.cadastro.id.to_s)
		
			redes.each do |rede|
			#byebug

				if rede.linha > 2
					doacoes = Doacao.joins('inner join ciclos cl on cl.id = ciclo_doador_id').where("cadastro_doador_id = " + rede.cadastro_id.to_s + "and ciclo_doador_id = " + rede.cadastro.ciclo.id.to_s )
					if doacoes.empty?

					    start = Doacao.new
					    start.cadastro_doador_id = rede.cadastro_id
					    start.cadastro_recebedor_id = rede.parent.parent.cadastro.id
					    start.cadastro_principal_id = rede.cadastro_id
					    start.ciclo_doador_id = rede.cadastro.ciclo.id
					    start.ciclo_recebedor_id = rede.parent.parent.cadastro.ciclo.id
					    start.flagenviada = false
					    start.save			
					    	
					end			
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

		@doacaospendentesreceber = Doacao.where("cadastro_recebedor_id =" + user.cadastro.id.to_s + "and flagenviada = true and dataconfirmacao is null")
		@doacaospendentesreceberreentradas = Doacao.joins("inner join reentradas re on re.cadastro_adicionado_id = doacaos.cadastro_recebedor_id").where("re.cadastro_principal_id = " + user.cadastro.id.to_s + "and flagenviada = true and dataconfirmacao is null")
		
		@doacaospendentespagar = Doacao.where("cadastro_doador_id =" + user.cadastro.id.to_s + "and flagenviada = false and dataconfirmacao is null")
		@doacaospendentesreentradas = Doacao.joins("inner join reentradas re on re.cadastro_adicionado_id = doacaos.cadastro_doador_id").where("re.cadastro_principal_id = " + user.cadastro.id.to_s + "and flagenviada = false and dataconfirmacao is null")


		#Controle de mensagens
		@mensagem = Mensagem.where("cadastro_1_id =" + user.cadastro.id.to_s + "and datarecebimento is null")
		@mensagems = Mensagem.where(:cadastro_1_id => user.cadastro.id)

		#Contador de doações		
		@doacoesrecebidas = 0#= Doacao.joins('inner join ciclos cl on cl.id = ciclo_id').where("cadastro_principal_id = " + user.cadastro.id.to_s + "and dataconfirmacao is not null" ).sum('valorciclo')

		#Contador de indicados
		@indicados = Indicado.where('cadastro_1_id = ' + user.cadastro.id.to_s).count

		verdoacoes

	end	

	def faq
	end

	def wellcome
	end	
	
	def configu
	end

	def redeslist
		@cadastro_id = params[:cadastro_id]
		@cadastro = Cadastro.find_by_id(@cadastro_id)
		@rede = Rede.find_by_cadastro_id(@cadastro_id)

		#Filhos
		@filho_primeiro = @rede.children.first rescue nil
		@filho_segundo = @rede.children.second rescue nil


		#Netos
		@neto_primeiro = @filho_primeiro.children.first rescue nil
		@neto_segundo = @filho_primeiro.children.second rescue nil
		@neto_terceiro = @filho_segundo.children.first rescue nil
		@neto_quarto = @filho_segundo.children.second rescue nil

		#Bisnetos
		@bisneto_primeiro = @neto_primeiro.children.first rescue nil
		@bisneto_segundo = @neto_primeiro.children.second rescue nil
		@bisneto_terceiro = @neto_segundo.children.first rescue nil
		@bisneto_quarto = @neto_segundo.children.second rescue nil
		@bisneto_quinto = @neto_terceiro.children.first rescue nil
		@bisneto_sexto = @neto_terceiro.children.second rescue nil
		@bisneto_setimo = @neto_quarto.children.first rescue nil
		@bisneto_oitavo = @neto_quarto.children.second rescue nil

	end	
	
end
