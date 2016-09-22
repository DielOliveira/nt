class SolicitacaosController < ApplicationController
  before_action :set_solicitacao, only: [:show, :edit, :update, :destroy]

  # GET /solicitacaos
  # GET /solicitacaos.json
  def index

    if usuario_logado && user.cadastro_id == 1
        @solicitacaos = Solicitacao.all
    else
        redirect_to root_path
    end

  end

  # GET /solicitacaos/1
  # GET /solicitacaos/1.json
  def show
  end

  # GET /solicitacaos/new
  def new
    @solicitacao = Solicitacao.new
  end

  # GET /solicitacaos/1/edit
  def edit
  end

  # POST /solicitacaos
  # POST /solicitacaos.json
  def create
    @solicitacao = Solicitacao.new(solicitacao_params)

    respond_to do |format|
      if @solicitacao.save
        format.html { redirect_to @solicitacao, notice: 'Solicitacao was successfully created.' }
        format.json { render :show, status: :created, location: @solicitacao }
      else
        format.html { render :new }
        format.json { render json: @solicitacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solicitacaos/1
  # PATCH/PUT /solicitacaos/1.json
  def update
    respond_to do |format|
      if @solicitacao.update(solicitacao_params)
        format.html { redirect_to @solicitacao, notice: 'Solicitacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @solicitacao }
      else
        format.html { render :edit }
        format.json { render json: @solicitacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solicitacaos/1
  # DELETE /solicitacaos/1.json
  def destroy
    @solicitacao.destroy
    respond_to do |format|
      format.html { redirect_to solicitacaos_url, notice: 'Solicitacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solicitacao
      @solicitacao = Solicitacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solicitacao_params
      params.require(:solicitacao).permit(:titulo, :descricao, :situacaodemanda_id, :dataprevisao, :anexo, :resolucao)
    end
end
