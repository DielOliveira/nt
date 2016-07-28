module StaticPagesHelper

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
end
