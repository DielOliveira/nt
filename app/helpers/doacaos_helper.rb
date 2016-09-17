module DoacaosHelper


	def recebeuDoacao(cadastro_id,ciclo_id)

		doacoes = Doacao.where('cadastro_recebedor_id = ? and ciclo_recebedor_id = ?' , cadastro_id, ciclo_id)

		if doacoes.count > 0
			return true
		else
			return false
		end


	end


end
