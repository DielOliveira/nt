module Utilities

	def rede

      rede = Rede.find_by_cadastro_id(user.cadastro.id)

	end	

	def verdoacoes
	    rede = Rede.find_by_cadastro_id(user.cadastro.id)
	
		if rede.linha > 2
			doacoes = Doacao.joins('inner join ciclos cl on cl.id = ciclo_id').where("cadastro_1_id = " + user.cadastro.id.to_s + "and ciclo_id = " + user.cadastro.ciclo.numerociclo.to_s )
			#byebug
			if doacoes.empty?

			    start = Doacao.new
			    start.cadastro_1_id = user.cadastro.id
			    start.cadastro_2_id = rede.parent.parent.cadastro.id
			    start.ciclo_id = user.cadastro.ciclo.id
			    start.flagenviada = false
			    start.save			
			    	
		    	return true
			end			
		end

	end

	def proximaentrada

	    linha1 = Rede.where("linha = 1")
	    linha1Preenchidos = Rede.where("linha = 1 and cadastro_id is not null")
	    linha2 = Rede.where("linha = 2")
	    linha2Preenchidos = Rede.where("linha = 2 and cadastro_id is not null") 
	    linha3 = Rede.where("linha = 3")
	    linha3Preenchidos = Rede.where("linha = 3 and cadastro_id is not null") 
	    linha4 = Rede.where("linha = 4")
	    linha4Preenchidos = Rede.where("linha = 4 and cadastro_id is not null") 
	    linha5 = Rede.where("linha = 5")
	    linha5Preenchidos = Rede.where("linha = 5 and cadastro_id is not null") 
	    linha6 = Rede.where("linha = 6")
	    linha6Preenchidos = Rede.where("linha = 6 and cadastro_id is not null") 
	    linha7 = Rede.where("linha = 7")
	    linha7Preenchidos = Rede.where("linha = 7 and cadastro_id is not null") 
	    linha8 = Rede.where("linha = 8")
	    linha8Preenchidos = Rede.where("linha = 8 and cadastro_id is not null") 
	    linha9 = Rede.where("linha = 9")
	    linha9Preenchidos = Rede.where("linha = 9 and cadastro_id is not null") 
	    linha10 = Rede.where("linha = 10")
	    linha10Preenchidos = Rede.where("linha = 10 and cadastro_id is not null")


	    if linha1.count > linha1Preenchidos.count

	    	return  Rede.where("linha = 1 and cadastro_id is null").minimum(:id)
    		 
    	end 

		if linha2.count > linha2Preenchidos.count

	    	return  Rede.where("linha = 2 and cadastro_id is null").minimum(:id)
	    		
    	end 

	    if linha3.count > linha3Preenchidos.count

	    	return  Rede.where("linha = 3 and cadastro_id is null").minimum(:id)
	    		
    	end 

	    if linha4.count > linha4Preenchidos.count

	    	return  Rede.where("linha = 4 and cadastro_id is null").minimum(:id)
	    		
    	end 

	    if linha5.count > linha5Preenchidos.count

	    	return  Rede.where("linha = 5 and cadastro_id is null").minimum(:id)
	    		
    	end 

	    if linha6.count > linha6Preenchidos.count

	    	return  Rede.where("linha = 6 and cadastro_id is null").minimum(:id)
	    		
    	end 

	    if linha7.count > linha7Preenchidos.count

	    	return  Rede.where("linha = 7 and cadastro_id is null").minimum(:id)
	    		
    	end     	    	    	    	    	    	

	    if linha8.count > linha8Preenchidos.count

	    	return  Rede.where("linha = 8 and cadastro_id is null").minimum(:id)
	    		
    	end 


	    if linha9.count > linha9Preenchidos.count

	    	return  Rede.where("linha = 9 and cadastro_id is null").minimum(:id)
	    		
    	end 

	    if linha10.count > linha10Preenchidos.count

	    	return  Rede.where("linha = 10 and cadastro_id is null").minimum(:id)
	    		
    	end
	        

	end

end