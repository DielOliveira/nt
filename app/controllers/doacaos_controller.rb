class DoacaosController < ApplicationController
  before_action :requer_logon
  before_action :set_doacao, only: [:show, :edit, :update, :destroy]

  # GET /doacaos
  # GET /doacaos.json
  def index
    @doacaos = Doacao.all
  end

  def doacoesrealizadas  
    @doacaos = Doacao.where("cadastro_1_id =" + user.cadastro.id.to_s + "and cadastro_2_id is not null")
  end

  def doacoesrecebidas  
    @doacaos = Doacao.where("cadastro_2_id =" + user.cadastro.id.to_s + "and cadastro_1_id is not null and dataconfirmacao is not null")
  end

  def doacoesareceber  
    @doacaos = Doacao.where("cadastro_2_id =" + user.cadastro.id.to_s + "and cadastro_1_id is not null and dataconfirmacao is null")
  end    

  # GET /doacaos/1
  # GET /doacaos/1.json
  def show
  end

  # GET /doacaos/new
  def new
    @doacao = Doacao.new
  end

  # GET /doacaos/1/edit
  def edit
  end

  # POST /doacaos
  # POST /doacaos.json
  def create
    @doacao = Doacao.new(doacao_params)

    respond_to do |format|
      if @doacao.save
        format.html { redirect_to @doacao, notice: 'Doacao was successfully created.' }
        format.json { render :show, status: :created, location: @doacao }
      else
        format.html { render :new }
        format.json { render json: @doacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doacaos/1
  # PATCH/PUT /doacaos/1.json
  def update
    respond_to do |format|
      if @doacao.update(doacao_params)
        format.html { redirect_to @doacao, notice: 'Doacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @doacao }
      else
        format.html { render :edit }
        format.json { render json: @doacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doacaos/1
  # DELETE /doacaos/1.json
  def destroy
    @doacao.destroy
    respond_to do |format|
      format.html { redirect_to doacaos_url, notice: 'Doacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doacao
      @doacao = Doacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doacao_params
      params.require(:doacao).permit(:ciclo_id, :flagconfirmada, :flagrejeitada, :observacao, :dataconfirmacao)
    end
end
