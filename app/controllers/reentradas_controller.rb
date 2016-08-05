class ReentradasController < ApplicationController
  before_action :set_reentrada, only: [:show, :edit, :update, :destroy, :relogin]

  # GET /reentradas
  # GET /reentradas.json

  def relogin

        reset_session

        reentrada = Reentrada.find_by_id(params[:id])

        #byebug

        session[:ObjLogon] = Usuario.find_by_cadastro_id(reentrada.cadastro_2.id)


        if usuario_logado == true
          redirect_to root_path, notice: 'Usuario logado com sucesso.'
        else
           flash[:error] = "Usuario ou senha incorretos."
        end      
  end  

  def novareentrada

    #Cadastro
    principal = Cadastro.find(user.cadastro_id)

    count = Reentrada.where("cadastro_principal_id = " + principal.id.to_s)
    reentrando = Usuario.find_by_cadastro_id(params[:cadastro_id])
    
    cadastro = Cadastro.new
    cadastro.nomepessoa = principal.nomepessoa + "-" + (count.count + 1).to_s
    cadastro.masculino = reentrando.cadastro.masculino
    cadastro.email = principal.email + "-" + (count.count + 1).to_s
    cadastro.descconfirmaemail = principal.email + "-" + (count.count + 1).to_s
    cadastro.telefone = reentrando.cadastro.telefone
    cadastro.operadora_id = reentrando.cadastro.operadora_id
    cadastro.whatsapp = reentrando.cadastro.whatsapp
    cadastro.skype = reentrando.cadastro.skype
    cadastro.facebook = reentrando.cadastro.facebook
    cadastro.cpf = reentrando.cadastro.cpf
    cadastro.ciclo_id = reentrando.cadastro.ciclo_id =  1
    cadastro.flagreentrada = true
    cadastro.cpfpadrinho = reentrando.email
    cadastro.flagativo = false

    cadastro.save

    #Financeiro
    financeirocopiar = Dadosfinanceiro.find_by_cadastro_id(params[:cadastro_id].to_s)
    financeiro = Dadosfinanceiro.new
    financeiro.nometitular = financeirocopiar.nometitular
    financeiro.cpftitular = financeirocopiar.cpftitular
    financeiro.banco_id = financeirocopiar.banco_id
    financeiro.agencia = financeirocopiar.agencia
    financeiro.codigo = financeirocopiar.codigo
    financeiro.operacao = financeirocopiar.operacao
    financeiro.contabancariatipo_id = financeirocopiar.contabancariatipo_id
    financeiro.observacao = financeirocopiar.observacao
    financeiro.emailsuperconta = financeirocopiar.emailsuperconta
    financeiro.cadastro_id = cadastro.id
    financeiro.save

    #user
    usuario = Usuario.new
    usuario.email = cadastro.email
    usuario.senha = reentrando.senha
    usuario.cadastro_id = cadastro.id
    usuario.dataultimologin = reentrando.dataultimologin
    usuario.flagativo = reentrando.flagativo
    usuario.descconfirmasenha = reentrando.senha
    usuario.save

    #rede
    rede = Rede.find_by_id(proximaentrada(1).to_i)
    rede.cadastro_id = cadastro.id
    rede.save


    #reentrada
    reentrada = Reentrada.new
    reentrada.cadastro_reentrando_id = reentrando.cadastro.id
    reentrada.cadastro_adicionado_id = cadastro.id
    reentrada.cadastro_principal_id = user.cadastro.id
    reentrada.ciclo_id = user.cadastro.ciclo.id

    
    if reentrada.save
      redirect_to reentradas_path
    end

  end



  def index
    @reentradas = Reentrada.where("cadastro_principal_id = " + user.cadastro.id.to_s)
  end

  # GET /reentradas/1
  # GET /reentradas/1.json
  def show
  end

  # GET /reentradas/new
  def new
    @reentrada = Reentrada.new
  end

  # GET /reentradas/1/edit
  def edit
  end

  # POST /reentradas
  # POST /reentradas.json
  def create
    @reentrada = Reentrada.new(reentrada_params)

    @reentrada.cadastro_1_id = user.cadastro.id

    respond_to do |format|
      if @reentrada.save
        format.html { redirect_to reentradas_path, notice: 'Reentrada was successfully created.' }
        format.json { render :show, status: :created, location: @reentrada }
      else
        format.html { render :new }
        format.json { render json: @reentrada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reentradas/1
  # PATCH/PUT /reentradas/1.json
  def update
    respond_to do |format|
      if @reentrada.update(reentrada_params)
        format.html { redirect_to @reentrada, notice: 'Reentrada was successfully updated.' }
        format.json { render :show, status: :ok, location: @reentrada }
      else
        format.html { render :edit }
        format.json { render json: @reentrada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reentradas/1
  # DELETE /reentradas/1.json
  def destroy
    @reentrada.destroy
    respond_to do |format|
      format.html { redirect_to reentradas_url, notice: 'Reentrada was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reentrada
      @reentrada = Reentrada.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reentrada_params
      params.fetch(:reentrada, {})
    end

     
end
