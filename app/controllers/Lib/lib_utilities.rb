module Utilities

  def corrigeFinan

    begin

      reentradas = Reentrada.where("cadastro_principal_id = " + user.cadastro.id.to_s)
      reentradas.each do |reentrada|

        finanReentrada = Dadosfinanceiro.find_by_cadastro_id(reentrada.cadastro_adicionado.id)

        if finanReentrada
          finanReentrada.nometitular = userfinan.nometitular
          finanReentrada.contapicpay = userfinan.contapicpay
          finanReentrada.observacao = userfinan.observacao
          finanReentrada.save(:validate => true)
        end

      end
    rescue
      flash[:danger] = "Erro ao carregar página."
    end

  end
  
	def rede

      rede = Rede.find_by_cadastro_id(user.cadastro.id)

	end	

def proximaentrada(ciclo_id)

      linha1 = Rede.where("linha = 1 and ciclo_id = ?", ciclo_id)
      linha1Preenchidos = Rede.where("linha = 1 and cadastro_id is not null and ciclo_id = ?", ciclo_id)
      linha2 = Rede.where("linha = 2 and ciclo_id = ?", ciclo_id)
      linha2Preenchidos = Rede.where("linha = 2 and cadastro_id is not null and ciclo_id = ?", ciclo_id)
      linha3 = Rede.where("linha = 3 and ciclo_id = ?", ciclo_id)
      linha3Preenchidos = Rede.where("linha = 3 and cadastro_id is not null and ciclo_id = ?", ciclo_id)
      linha4 = Rede.where("linha = 4 and ciclo_id = ?", ciclo_id)
      linha4Preenchidos = Rede.where("linha = 4 and cadastro_id is not null and ciclo_id = ?", ciclo_id)
      linha5 = Rede.where("linha = 5 and ciclo_id = ?", ciclo_id)
      linha5Preenchidos = Rede.where("linha = 5 and cadastro_id is not null and ciclo_id = ?", ciclo_id)
      linha6 = Rede.where("linha = 6 and ciclo_id = ?", ciclo_id)
      linha6Preenchidos = Rede.where("linha = 6 and cadastro_id is not null and ciclo_id = ?", ciclo_id)
      linha7 = Rede.where("linha = 7 and ciclo_id = ?", ciclo_id)
      linha7Preenchidos = Rede.where("linha = 7 and cadastro_id is not null and ciclo_id = ?", ciclo_id)
      linha8 = Rede.where("linha = 8 and ciclo_id = ?", ciclo_id)
      linha8Preenchidos = Rede.where("linha = 8 and cadastro_id is not null and ciclo_id = ?", ciclo_id)
      linha9 = Rede.where("linha = 9 and ciclo_id = ?", ciclo_id)
      linha9Preenchidos = Rede.where("linha = 9 and cadastro_id is not null and ciclo_id = ?", ciclo_id)
      linha10 = Rede.where("linha = 10 and ciclo_id = ?", ciclo_id)
      linha10Preenchidos = Rede.where("linha = 10 and cadastro_id is not null and ciclo_id = ?", ciclo_id)
      linha11 = Rede.where("linha = 11 and ciclo_id = ?", ciclo_id)
      linha11Preenchidos = Rede.where("linha = 11 and cadastro_id is not null and ciclo_id = ?", ciclo_id)      


      if linha1.count > linha1Preenchidos.count

        return  Rede.where("linha = 1 and cadastro_id is null and ciclo_id = ?", ciclo_id).order(:ordem).first.id
         
      end 

      if linha2.count > linha2Preenchidos.count

        return  Rede.where("linha = 2 and cadastro_id is null and ciclo_id = ?", ciclo_id).order(:ordem).first.id
          
      end 

      if linha3.count > linha3Preenchidos.count

        return  Rede.where("linha = 3 and cadastro_id is null and ciclo_id = ?", ciclo_id).order(:ordem).first.id
          
      end 

      if linha4.count > linha4Preenchidos.count

        return  Rede.where("linha = 4 and cadastro_id is null and ciclo_id = ?", ciclo_id).order(:ordem).first.id
          
      end 

      if linha5.count > linha5Preenchidos.count

        return  Rede.where("linha = 5 and cadastro_id is null and ciclo_id = ?", ciclo_id).order(:ordem).first.id
          
      end 

      if linha6.count > linha6Preenchidos.count

        return  Rede.where("linha = 6 and cadastro_id is null and ciclo_id = ?", ciclo_id).order(:ordem).first.id
          
      end 

      if linha7.count > linha7Preenchidos.count

        return  Rede.where("linha = 7 and cadastro_id is null and ciclo_id = ?", ciclo_id).order(:ordem).first.id
          
      end                                     

      if linha8.count > linha8Preenchidos.count

        return  Rede.where("linha = 8 and cadastro_id is null and ciclo_id = ?", ciclo_id).order(:ordem).first.id
          
      end 


      if linha9.count > linha9Preenchidos.count

        return  Rede.where("linha = 9 and cadastro_id is null and ciclo_id = ?", ciclo_id).order(:ordem).first.id
          
      end 

      if linha10.count > linha10Preenchidos.count

        return  Rede.where("linha = 10 and cadastro_id is null and ciclo_id = ?", ciclo_id).order(:ordem).first.id
          
      end
          

  end   	
	

end