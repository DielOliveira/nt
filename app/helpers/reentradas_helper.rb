module ReentradasHelper

	def upgrade(cadastro_id)

		cadastro = Cadastro.find_by_id(cadastro_id)

		ciclo = cadastro.ciclo.numerociclo


			doacoesRecebidas = Doacao.where('cadastro_recebedor_id =' + cadastro_id.to_s + 'and ciclo_recebedor_id = ' + ciclo.to_s + 'and dataconfirmacao is not null')
			
			if doacoesRecebidas.count >= 4
				return 'obrigatoria'
			else
				return 'opcional'
			end

	end

	def reentradasCiclo(cadastro_id,ciclo_id)
    	return Reentrada.where("cadastro_reentrando_id = ? and ciclo_id = ? and flagopcional = false ", cadastro_id, ciclo_id)
  	end	

	def reentrada(cadastro_id)

		cadastro = Cadastro.find_by_id(cadastro_id)

		ciclo = cadastro.ciclo.numerociclo

		reentradas = Reentrada.where('cadastro_reentrando_id = ' + cadastro_id.to_s + ' and ciclo_id = ' + ciclo.to_s + ' and flagopcional = false')

		doacaorealizada = Doacao.where('cadastro_doador_id = ' + cadastro_id.to_s + ' and ciclo_doador_id = ' + ciclo.to_s)
		doacaorecebida = Doacao.where('cadastro_recebedor_id = ' + cadastro_id.to_s + ' and ciclo_recebedor_id = ' + ciclo.to_s)

		if reentradas.count < cadastro.ciclo.qtdreentradas && doacaorecebida.count >= 1
			return 'obrigatoria'
		else
			return 'opcional'
		end

	end

	def qtReentradas(cadastro_id,ciclo_id)

	end


end
