module StaticPagesHelper

	def somatudo(numeros)
		count = 0
		Rede.find_by_id(numeros).walk_tree do |page, level|
		  #link_to "#{'---'*level}#{page.desc}", rede_path(page)

		  if page.cadastro_id != nil
		  	count = count + 1
	  	  end

		end 

		return count

	end

	def contapessoas(rede_id)

		dados = Rede.where('parent_id = ? and cadastro_id is not null ', rede_id)

		if dados


			dados.each do |dados_pessoas|

				@html = (dados.count).to_s + contapessoas(dados_pessoas.id)

			end

		end
			

		return @html.to_s
		
	end


	def title(page_title)
	  content_for :title, page_title.to_s
	end

	def painel(page_title)
	  content_for :painel, page_title.to_s
	end

	def doacaoBloqueada(cadastro_id,ciclo_id)

		doacaofeita = Doacao.where('cadastro_doador_id = ' + cadastro_id + ' and ciclo_doador_id = ' + ciclo_id + ' and dataconfirmacao is not null')

		doacaorecebida = Doacao.where('cadastro_recebedor_id = ' + cadastro_id + ' and ciclo_recebedor_id = ' + ciclo_id + ' and dataconfirmacao is not null')

		if doacaofeita.count == 0 && doacaorecebida.count == 3
			if cadastro_id != 1
				return false
			else
				return true
			end
		else
			return false
		end
	end

  def obrigacoes
    return Reentrada.where("cadastro_principal_id = " + user.cadastro.id.to_s)
  end

  def apareceobrigacaoreentrada
	obrigacoes.each do |reentrada|

		if reentrada(reentrada.cadastro_adicionado_id) == 'opcional'
			return false
		else
			return true
		end

	end

  end 


end
