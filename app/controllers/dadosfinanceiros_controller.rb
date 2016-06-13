class DadosfinanceirosController < ApplicationController
  before_action :set_dadosfinanceiro, only: [:show, :edit, :update, :destroy]

  # GET /dadosfinanceiros
  # GET /dadosfinanceiros.json
  def index
    @dadosfinanceiros = Dadosfinanceiro.all
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

    respond_to do |format|
      if @dadosfinanceiro.save
        format.html { redirect_to new_usuario_path, notice: 'Dadosfinanceiro was successfully created.' }
        format.json { render :show, status: :created, location: @dadosfinanceiro }
      else
        format.html { render :new }
        format.json { render json: @dadosfinanceiro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dadosfinanceiros/1
  # PATCH/PUT /dadosfinanceiros/1.json
  def update
    respond_to do |format|
      if @dadosfinanceiro.update(dadosfinanceiro_params)
        format.html { redirect_to @dadosfinanceiro, notice: 'Dadosfinanceiro was successfully updated.' }
        format.json { render :show, status: :ok, location: @dadosfinanceiro }
      else
        format.html { render :edit }
        format.json { render json: @dadosfinanceiro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dadosfinanceiros/1
  # DELETE /dadosfinanceiros/1.json
  def destroy
    @dadosfinanceiro.destroy
    respond_to do |format|
      format.html { redirect_to dadosfinanceiros_url, notice: 'Dadosfinanceiro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dadosfinanceiro
      @dadosfinanceiro = Dadosfinanceiro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dadosfinanceiro_params
      params.require(:dadosfinanceiro).permit(:nometitular, :cpftitular, :banco_id, :agencia, :codigo, :operacao, :contabancariatipo_id, :observacao, :emailsuperconta, :datainclulsao, :cadastro_id)
    end
end
