class ReentradasController < ApplicationController
  before_action :set_reentrada, only: [:show, :edit, :update, :destroy]

  # GET /reentradas
  # GET /reentradas.json

  def novareentrada

    #Cadastro
    count = Reentrada.where("cadastro_1_id = " + user.cadastro.id.to_s)
    cadastro = Cadastro.new
    cadastro.nomepessoa = user.cadastro.nomepessoa
    cadastro.masculino = user.cadastro.masculino
    cadastro.email = user.cadastro.email + "-" + (@count.count + 1).to_s
    cadastro.telefone = user.cadastro.telefone
    cadastro.operadora_id = user.cadastro.operadora_id
    cadastro.whatsapp = user.cadastro.whatsapp
    cadastro.skype = user.cadastro.skype
    cadastro.facebook = user.cadastro.facebook
    cadastro.cpf = user.cadastro.cpf
    cadastro.ciclo_id = user.cadastro.ciclo_id =  1
    cadastro.flagreentrada = true
    cadastro.save

:nometitular, :cpftitular, :banco_id, :agencia, :codigo, :operacao, :contabancariatipo_id, :observacao, :emailsuperconta, :datainclulsao, :cadastro_id)
    #Financeiro
    financeirocopiar = Dadosfinanceiro.find_by_cadastro_id(user.cadastro.id)
    financeiro = Dadosfinanceiro.new
    #financeiro.

    reentrada = Reentrada.new

    reentrada.cadastro_1_id = user.cadastro.id
    reentrada.cadastro_2_id = @cadastro.id

      if reentrada.save
        redirect_to reentradas_path
      end
  end



  def index
    @reentradas = Reentrada.where("cadastro_1_id = " + user.cadastro.id.to_s)
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
