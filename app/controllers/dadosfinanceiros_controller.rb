#encoding: utf-8
class DadosfinanceirosController < ApplicationController
  before_action :set_dadosfinanceiro, only: [:show, :edit, :update, :destroy]

  # GET /dadosfinanceiros
  # GET /dadosfinanceiros.json
  def index

    if usuario_logado && user.cadastro_id == 1
        @dadosfinanceiros = Dadosfinanceiro.all
    else
        redirect_to root_path
    end
    
  end

  # GET /dadosfinanceiros/1
  # GET /dadosfinanceiros/1.json
  def show
  end

  # GET /dadosfinanceiros/new
  def new
    @dadosfinanceiro = Dadosfinanceiro.new
  end

  # GET /dadosfinanceiros/1/edit
  def edit
  end

  # POST /dadosfinanceiros
  # POST /dadosfinanceiros.json
  def create

    @dadosfinanceiro = Dadosfinanceiro.new(dadosfinanceiro_params)
    @dadosfinanceiro.cadastro_id = session[:cadastro_id]

    respond_to do |format|
      if @dadosfinanceiro.save
        format.html { redirect_to new_usuario_path, notice: 'Dados financeiros criados com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /dadosfinanceiros/1
  # PATCH/PUT /dadosfinanceiros/1.json
  def update

    respond_to do |format|
      if @dadosfinanceiro.update(dadosfinanceiro_params)

        @usuario = Usuario.find_by_cadastro_id(@dadosfinanceiro.cadastro_id)

        if @usuario == nil
          format.html { redirect_to new_usuario_path, notice: 'Dados financeiros alterados com sucesso.' }
        else
          format.html { redirect_to edit_usuario_path(@usuario.id), notice: 'Dados financeiroas alterados com sucesso.' }
        end
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /dadosfinanceiros/1
  # DELETE /dadosfinanceiros/1.json
  def destroy
    @dadosfinanceiro.destroy
    respond_to do |format|
      format.html { redirect_to dadosfinanceiros_url, notice: 'Dados financeiros excluídos com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dadosfinanceiro

      if usuario_logado && user.cadastro_id == 1
        @dadosfinanceiro = Dadosfinanceiro.find(params[:id])
      else
        params[:id] = userfinan.id
        @dadosfinanceiro = Dadosfinanceiro.find(params[:id])
      end

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dadosfinanceiro_params
      params.require(:dadosfinanceiro).permit(:nometitular, :cpftitular, :banco_id, :agencia, :codigo, :operacao, :contabancariatipo_id, :observacao, :emailsuperconta, :datainclulsao, :cadastro_id, :contapicpay)
    end
end
