	class StaticPagesController < ApplicationController
	#before_action :requer_logon

	def relatorioreentradaspendentes

		@cadastros = Cadastro.all.order(:created_at)#.paginate(:page => params[:page], :per_page => 40)

	end

	def corrigereentradas

	    begin

	        reentradas = Reentrada.where('cadastro_principal_id = ?', user.cadastro.id).order(:created_at)

	        count = 1
	        reentradas.each do |reentrada|

	          cadastroAtualizar = reentrada.cadastro_adicionado

	          cadastroAtualizar.nomepessoa = user.cadastro.nomepessoa + "-" + count.to_s
			  
	          cadastroAtualizar.save(:validate => false)

	          count = count + 1
	        end

	    rescue
	        flash[:danger] = "Erro ao fazer correção de reentradas."
	    end
	end	

	def relatorio

		if not (usuario_logado && user.cadastro_id == 1) 
			flash[:danger] = "Desculpe, você não possui permissão."
			redirect_to root_path
		end

		 query = ' '
		 query2 = ' '

		if params["ciclo_id"].to_s != '0' and params["ciclo_id"].to_s != ''
			query = query + ' red.ciclo_id = ' + params["ciclo_id"].to_s + ' and '
			#query2 = query2 + ' and cadastros.ciclo_id = red.ciclo_id '
		end

		if params["flagativo"].to_s == '2'
			query = query + ' cadastros.flagativo = false' + ' and '
		elsif params["flagativo"].to_s == '1'
			query = query + ' cadastros.flagativo = true' + ' and '
		end

		if params["linha"].to_s != '0' and params["linha"].to_s != ''
			query = query + ' red.linha = ' + params["linha"].to_s + ' and '
		end

		if params["flagreentrada"].to_s == '1'
			query = query + ' flagreentrada = false and '
		elsif params["flagreentrada"].to_s == '2'
			query = query + ' flagreentrada = true and '
		end			

		if params["nomepessoa"].to_s != ''
			params["nomepessoa"] = params["nomepessoa"].downcase
		end

		query = query + ' 1 = 1 '


		@cadastros = Cadastro.joins('inner join usuarios usu on usu.cadastro_id = cadastros.id inner join redes red on red.cadastro_id = cadastros.id ' + query2).where(' lower(nomepessoa) like ? and ' + query, "%#{params["nomepessoa"]}%").order('cadastros.created_at asc').paginate(:page => params[:page], :per_page => 40)
	end

	def configuracoes

		if not (usuario_logado && user.cadastro_id == 1) 
			flash[:danger] = "Desculpe, você não possui permissão."
			redirect_to root_path
		end		

	end

	def index

		if usuario_logado
			redirect_to home_path
		end
		
	end

	def retiralixo

		if not (usuario_logado && user.cadastro_id == 1) 
			flash[:danger] = "Desculpe, você não possui permissão."
			redirect_to root_path
		end		

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

	def confirmaDoacoes

		begin

			doacaosVencendo = Doacao.where('tempo < ? and flagenviada = true and flagconfirmada = false', Time.now).order(:created_at)

			doacaosVencendo.each do |doacao|

				doacao.flagconfirmada = true
				doacao.dataconfirmacao = Time.now
				doacao.save(:validate => false)

			    cadastro = Cadastro.find(doacao.cadastro_doador_id)
			    cadastro.flagativo = true				
			    cadastro.save(:validate => false)

				obrigacao = Obrigacao.where('cadastro_adicionado_id = ? and flagrealizado = false',doacao.cadastro_doador_id)
				if not obrigacao.blank?
					obrigacao.first.flagrealizado = true
					obrigacao.first.save
				end

			end


		rescue
			flash[:danger] = "Erro no sistema. Contate o administrador."
		end

	end

	def validacadastro

		begin

			doacaosVencendo = Doacao.where('tempo < ? and flagenviada = false', Time.now).order(:created_at)


			doacaosVencendo.each do |doacao|

				obrigacaos = Obrigacao.where('cadastro_adicionado_id = ? and flagrealizado =  false',doacao.cadastro_doador_id)

				if obrigacaos.blank?

					if doacao.cadastro_doador.ciclo.id == 1

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

						cadastro.destroy

					else 

						cadastro = Cadastro.find_by_id(doacao.cadastro_doador_id)

						rede = Rede.where('cadastro_id = ? and ciclo_id = ?', cadastro.id, cadastro.ciclo_id)
						if not rede.first.blank?
							rede.first.cadastro_id = nil
							rede.first.save
						end					

						cadastro.ciclo_id = cadastro.ciclo_id - 1
						cadastro.save(:validate => false)

					end

					doacao.destroy
				end

			end

		rescue
			flash[:danger] = "Erro no sistema. Contate o administrador."
		end

		#redirect_to doacoesVencidas_path		

	end

	def adicionaDoacoes

		    rede = Rede.where('cadastro_id = ? and ciclo_id = ?',user.cadastro.id, user.cadastro.ciclo_id).first
		
			if rede.linha > 2
				doacoes = Doacao.joins('inner join ciclos cl on cl.id = ciclo_doador_id').where("cadastro_doador_id = " + user.cadastro.id.to_s + "and ciclo_doador_id = " + user.cadastro.ciclo.id.to_s )
				if doacoes.empty?

					if rede.parent.parent.cadastro.flagativo

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
			end

		    reentradas = Reentrada.where('cadastro_principal_id = ? ', user.cadastro.id.to_s)
		
			reentradas.each do |reentrada|

				rede = Rede.where('cadastro_id = ? and ciclo_id = ?', reentrada.cadastro_adicionado_id, reentrada.cadastro_adicionado.ciclo_id).first

				doacoes = Doacao.joins('inner join ciclos cl on cl.id = ciclo_doador_id').where("cadastro_doador_id = " + reentrada.cadastro_adicionado_id.to_s + "and ciclo_doador_id = " + reentrada.cadastro_adicionado.ciclo_id.to_s )
				if doacoes.empty?


					if rede.parent.parent.cadastro.flagativo

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

		end

	def home

		#Posicionando na rede
		redeatual = Rede.find_by_cadastro_id(user.cadastro.id)
		if redeatual.blank?

		
	        rede = Rede.find_by_id(proximaentrada(1))
	        rede.cadastro_id = user.cadastro.id
	        rede.save

	    end

	    #Valida cadastros (doações vencidas)
		validacadastro

		#Confirmando doações com prazo finalizado
	    confirmaDoacoes

	    #Adicionando doações necessárias
		adicionaDoacoes

		#Corrige nome das reetradas
		corrigereentradas


		#Exibindo doações a receber
		doacaospendentesreceber = Doacao.where("cadastro_recebedor_id =" + user.cadastro.id.to_s + " and flagconfirmada = false")
		doacaospendentesreceberreentradas = Doacao.joins("inner join reentradas re on re.cadastro_adicionado_id = doacaos.cadastro_recebedor_id").where("re.cadastro_principal_id = " + user.cadastro.id.to_s + " and flagconfirmada = false")
		@doacaospendentesreceber = doacaospendentesreceber + doacaospendentesreceberreentradas

		#Exibindo doações a pagar
		doacaospendentespagar = Doacao.where("cadastro_doador_id =" + user.cadastro.id.to_s + "and flagenviada = false and flagconfirmada = false")
		doacaospendentesreentradas = Doacao.joins("inner join reentradas re on re.cadastro_adicionado_id = doacaos.cadastro_doador_id").where("re.cadastro_principal_id = " + user.cadastro.id.to_s + "and flagenviada = false and flagconfirmada = false")
		@doacaos = doacaospendentespagar + doacaospendentesreentradas

		#Calculando valor pra exibição em box
		@doacoesrecebidas = 0		
		doacaospendentesreceber.each do |d|	
			@doacoesrecebidas = @doacoesrecebidas + d.ciclo_doador.valorciclo
		end

		#Calculando valor pra exibição em box
		doacaospendentesreceberreentradas.each do |d|	
			@doacoesrecebidas = @doacoesrecebidas + d.ciclo_doador.valorciclo
		end

		#Indicados direto pra exibição em box
		@indicados = Indicado.where('cadastro_1_id = ' + user.cadastro.id.to_s).count

		#Exibindo doações que aguardam aprovações
		doacoesAguardando = Doacao.where("cadastro_doador_id =" + user.cadastro.id.to_s + "and flagenviada = true and flagconfirmada = false")
		doacoesAguardandoReentradas = Doacao.joins("inner join reentradas re on re.cadastro_adicionado_id = doacaos.cadastro_doador_id").where("re.cadastro_principal_id = " + user.cadastro.id.to_s + "and flagenviada = true and flagconfirmada = false")
		@doacoesAguardando = doacoesAguardando + doacoesAguardandoReentradas
	end	

	def faq
	end

	def wellcome
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
		@filho_primeiro = @rede.first.children.order(:ordem).first rescue nil
		@filho_primeiro_usuario = Usuario.find_by_cadastro_id(@filho_primeiro.cadastro.id) rescue nil

		@filho_segundo = @rede.first.children.order(:ordem).second rescue nil
		@filho_segundo_usuario = Usuario.find_by_cadastro_id(@filho_segundo.cadastro.id) rescue nil


		#Netos
		@neto_primeiro = @filho_primeiro.children.order(:ordem).first rescue nil
		@neto_primeiro_usuario = Usuario.find_by_cadastro_id(@neto_primeiro.cadastro.id) rescue nil
		
		@neto_segundo = @filho_primeiro.children.order(:ordem).second rescue nil
		@neto_segundo_usuario = Usuario.find_by_cadastro_id(@neto_segundo.cadastro.id) rescue nil
		
		@neto_terceiro = @filho_segundo.children.order(:ordem).first rescue nil
		@neto_terceiro_usuario = Usuario.find_by_cadastro_id(@neto_terceiro.cadastro.id) rescue nil
		
		@neto_quarto = @filho_segundo.children.order(:ordem).second rescue nil
		@neto_quarto_usuario = Usuario.find_by_cadastro_id(@neto_quarto.cadastro.id) rescue nil

		#Bisnetos
		@bisneto_primeiro = @neto_primeiro.children.order(:ordem).first rescue nil
		@bisneto_primeiro_usuario = Usuario.find_by_cadastro_id(@bisneto_primeiro.cadastro.id) rescue nil
		
		@bisneto_segundo = @neto_primeiro.children.order(:ordem).second rescue nil
		@bisneto_segundo_usuario = Usuario.find_by_cadastro_id(@bisneto_segundo.cadastro.id) rescue nil
		
		@bisneto_terceiro = @neto_segundo.children.order(:ordem).first rescue nil
		@bisneto_terceiro_usuario = Usuario.find_by_cadastro_id(@bisneto_terceiro.cadastro.id) rescue nil
		
		@bisneto_quarto = @neto_segundo.children.order(:ordem).second rescue nil
		@bisneto_quarto_usuario = Usuario.find_by_cadastro_id(@bisneto_quarto.cadastro.id) rescue nil
		
		@bisneto_quinto = @neto_terceiro.children.order(:ordem).first rescue nil
		@bisneto_quinto_usuario = Usuario.find_by_cadastro_id(@bisneto_quinto.cadastro.id) rescue nil
		
		@bisneto_sexto = @neto_terceiro.children.order(:ordem).second rescue nil
		@bisneto_sexto_usuario = Usuario.find_by_cadastro_id(@bisneto_sexto.cadastro.id) rescue nil
		
		@bisneto_setimo = @neto_quarto.children.order(:ordem).first rescue nil
		@bisneto_setimo_usuario = Usuario.find_by_cadastro_id(@bisneto_setimo.cadastro.id) rescue nil
		
		@bisneto_oitavo = @neto_quarto.children.order(:ordem).second rescue nil
		@bisneto_oitavo_usuario = Usuario.find_by_cadastro_id(@bisneto_oitavo.cadastro.id) rescue nil

	end	
	
end
