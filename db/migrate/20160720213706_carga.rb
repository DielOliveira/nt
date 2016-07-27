class Carga < ActiveRecord::Migration
  def change

   	Banco.create(:nomebanco => "Bradesco")
    Banco.create(:nomebanco => "Itaú")
    Banco.create(:nomebanco => "Caixa Econômica")
    Banco.create(:nomebanco => "Santander")

    Operadora.create(:nomeoperadora => "Oi")
    Operadora.create(:nomeoperadora => "Claro")
    Operadora.create(:nomeoperadora => "Tim")
    Operadora.create(:nomeoperadora => "Vivo")


	Ciclo.create(:nomeciclo => "1", :numerociclo => 1, :valorciclo => 30.0, :qtdreentradas => 1)    
	Ciclo.create(:nomeciclo => "2", :numerociclo => 2, :valorciclo => 90.0, :qtdreentradas => 1)    
	Ciclo.create(:nomeciclo => "3", :numerociclo => 3, :valorciclo => 300.0, :qtdreentradas => 3)    
	Ciclo.create(:nomeciclo => "4", :numerociclo => 4, :valorciclo => 900.0, :qtdreentradas => 10)    
	Ciclo.create(:nomeciclo => "5", :numerociclo => 5, :valorciclo => 1800.0, :qtdreentradas => 20)    
	Ciclo.create(:nomeciclo => "6", :numerociclo => 6, :valorciclo => 3600.0, :qtdreentradas => 50)

    Contabancariatipo.create(:nometipo => "Corrente")

    #User 1
    cadastro1 = Cadastro.create(:nomepessoa => "Administrador", :masculino => true, :email => "adm@adm.com", :telefone => "9827", :operadora_id => 1, :cpf => "01188297180", :ciclo_id => 1, :flagreentrada => false)
    Dadosfinanceiro.create(:nometitular => "Administrador", :cpftitular => "01188297180", :banco_id => 1, :agencia => "9827", :codigo => "1234", :operacao => "3424", :contabancariatipo_id => 1, :cadastro_id => cadastro1.id)
	rede = Rede.create(:linha => 1, :cadastro_id => cadastro1.id)
	Usuario.create(:email => "adm@adm.com", :senha => "123", :descconfirmasenha => "123", :cadastro_id => cadastro1.id, :flagativo => true)

	#User 2
    cadastro2 = Cadastro.create(:cpfpadrinho => "adm@adm.com", :nomepessoa => "Marcio Ribeiro", :masculino => true, :email => "marcio@marcio.com", :telefone => "9827", :operadora_id => 1, :cpf => "32114504751", :ciclo_id => 1, :flagreentrada => false)
    Dadosfinanceiro.create(:nometitular => "Marcio Ribeiro", :cpftitular => "32114504751", :banco_id => 1, :agencia => "9827", :codigo => "1234", :operacao => "3424", :contabancariatipo_id => 1, :cadastro_id => cadastro2.id)
	Rede.create(:linha => 2, :cadastro_id => cadastro2.id, :parent_id => rede.id)
	Usuario.create(:email => "marcio@marcio.com", :senha => "123", :descconfirmasenha => "123", :cadastro_id => cadastro2.id, :flagativo => true)
	Indicado.create(:cadastro_1_id => cadastro1.id, :cadastro_2_id => cadastro2.id)

	#User 3
    cadastro3 = Cadastro.create(:cpfpadrinho => "adm@adm.com", :nomepessoa => "Eliando", :masculino => true, :email => "eliando@eliando.com", :telefone => "9827", :operadora_id => 1, :cpf => "87200468800", :ciclo_id => 1, :flagreentrada => false)
    Dadosfinanceiro.create(:nometitular => "Eliando", :cpftitular => "87200468800", :banco_id => 1, :agencia => "9827", :codigo => "1234", :operacao => "3424", :contabancariatipo_id => 1, :cadastro_id => cadastro3.id)
	Rede.create(:linha => 2, :cadastro_id => cadastro3.id, :parent_id => rede.id)
	Usuario.create(:email => "eliando@eliando.com", :senha => "123", :descconfirmasenha => "123", :cadastro_id => cadastro3.id, :flagativo => true)
	Indicado.create(:cadastro_1_id => cadastro1.id, :cadastro_2_id => cadastro3.id)

    linhas = Rede.where("linha = " + (2).to_s)

    linhas.each do |line|

      lineno = Rede.where("parent_id = " + line.id.to_s)

      if lineno.count == 0

        novarede = Rede.new
        novarede.parent_id = line.id
        novarede.linha = 3
        novarede.save

        novarede = Rede.new
        novarede.parent_id = line.id
        novarede.linha = 3
        novarede.save

      elsif lineno.count == 1
        
        novarede = Rede.new
        novarede.parent_id = line.id
        novarede.linha = 3
        novarede.save

      end 

    end

    linhas = Rede.where("linha = " + (3).to_s)

    linhas.each do |line|

      lineno = Rede.where("parent_id = " + line.id.to_s)

      if lineno.count == 0

        novarede = Rede.new
        novarede.parent_id = line.id
        novarede.linha = 4
        novarede.save

        novarede = Rede.new
        novarede.parent_id = line.id
        novarede.linha = 4
        novarede.save

      elsif lineno.count == 1
        
        novarede = Rede.new
        novarede.parent_id = line.id
        novarede.linha = 4
        novarede.save

      end 

    end        

    linhas = Rede.where("linha = " + (4).to_s)

    linhas.each do |line|

      lineno = Rede.where("parent_id = " + line.id.to_s)

      if lineno.count == 0

        novarede = Rede.new
        novarede.parent_id = line.id
        novarede.linha = 5
        novarede.save

        novarede = Rede.new
        novarede.parent_id = line.id
        novarede.linha = 5
        novarede.save

      elsif lineno.count == 1
        
        novarede = Rede.new
        novarede.parent_id = line.id
        novarede.linha = 5
        novarede.save

      end 

    end 

    linhas = Rede.where("linha = " + (5).to_s)

    linhas.each do |line|

      lineno = Rede.where("parent_id = " + line.id.to_s)

      if lineno.count == 0

        novarede = Rede.new
        novarede.parent_id = line.id
        novarede.linha = 6
        novarede.save

        novarede = Rede.new
        novarede.parent_id = line.id
        novarede.linha = 6
        novarede.save

      elsif lineno.count == 1
        
        novarede = Rede.new
        novarede.parent_id = line.id
        novarede.linha = 6
        novarede.save

      end 

    end   

    linhas = Rede.where("linha = " + (6).to_s)

    linhas.each do |line|

      lineno = Rede.where("parent_id = " + line.id.to_s)

      if lineno.count == 0

        novarede = Rede.new
        novarede.parent_id = line.id
        novarede.linha = 7
        novarede.save

        novarede = Rede.new
        novarede.parent_id = line.id
        novarede.linha = 7
        novarede.save

      elsif lineno.count == 1
        
        novarede = Rede.new
        novarede.parent_id = line.id
        novarede.linha = 7
        novarede.save

      end 

    end 

    linhas = Rede.where("linha = " + (7).to_s)

    linhas.each do |line|

      lineno = Rede.where("parent_id = " + line.id.to_s)

      if lineno.count == 0

        novarede = Rede.new
        novarede.parent_id = line.id
        novarede.linha = 8
        novarede.save

        novarede = Rede.new
        novarede.parent_id = line.id
        novarede.linha = 8
        novarede.save

      elsif lineno.count == 1
        
        novarede = Rede.new
        novarede.parent_id = line.id
        novarede.linha = 8
        novarede.save

      end 

    end                       

  end
end
