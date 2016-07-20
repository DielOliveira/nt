class StaticPagesController < ApplicationController
before_action :requer_logon

	def home
		@doacaospendentesreceber = Doacao.where("cadastro_2_id =" + user.cadastro.id.to_s + "and flagenviada = true and dataconfirmacao is null")
		@doacaospendentespagar = Doacao.where("cadastro_1_id =" + user.cadastro.id.to_s + "and flagenviada = false and dataconfirmacao is null")

		@rede = Rede.find_by_cadastro_id(user.cadastro_id)
		if @rede
			@dadosfinanceiros = Dadosfinanceiro.find_by_cadastro_id(@rede.parent.parent.cadastro.id) rescue nil
		end

		@mensagem = Mensagem.where("cadastro_1_id =" + user.cadastro.id.to_s + "and datarecebimento is null")

		@mensagems = Mensagem.where(:cadastro_1_id => user.cadastro.id)
		
		@doacoesrecebidas = Doacao.joins('inner join ciclos cl on cl.id = ciclo_id').where("cadastro_2_id = " + user.cadastro.id.to_s + "and dataconfirmacao is not null" ).sum('valorciclo')

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
