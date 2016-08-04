module StaticPagesHelper


	def contapessoas(rede_id)

		if rede_id == nil
			return 0
		end

		rede = Rede.find(rede_id)

		rede.children.each do |d|

			#byebug
			return rede.children.count + contapessoas(d.id)

		end

		
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
			return true
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
		
		else
			return true
		end

	end

  end 


end
