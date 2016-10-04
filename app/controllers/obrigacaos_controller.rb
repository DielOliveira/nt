class ObrigacaosController < ApplicationController
  before_action :set_obrigacao, only: [:show, :edit, :update, :destroy]

  def obrigacaodelete
    begin
      obrigacao = Obrigacao.find_by_id(params[:id])
      if not obrigacao.blank?
        obrigacao.destroy
      end
    rescue
      flash[:danger] = "Não foi possível realizar a exclusão."
      return redirect_to obrigacaoslist_path
    end

      flash[:success] = "Exclusão realizada com sucesso."
      return redirect_to obrigacaoslist_path

  end

  def obrigacaoslist

    begin
    
      if params["inicio"].to_i >= 0 and params["final"].to_i >= 1
        cadastros = Cadastro.where('contador >= ? and contador <=  ?', params["inicio"].to_i, params["final"].to_i)
        cadastros.each do |cadastro|

          obrigacao = Obrigacao.where('cadastro_id = ? and flagrealizado = false', cadastro.id)
          if obrigacao.blank?
            obrigacao = Obrigacao.new
            obrigacao.cadastro_id = cadastro.id
            obrigacao.flagrealizado = false
            obrigacao.save
          end

        end
      end

    rescue
      flash[:danger] = "Erro ao gerar reentradas. Verifique se os parâmetros estão corretos."
      return redirect_to obrigacaoslist_path
    end

    @obrigacaos = Obrigacao.all.order(:cadastro_id)

  end

  # GET /obrigacaos
  # GET /obrigacaos.json
  def index
    @obrigacaos = Obrigacao.all
  end

  # GET /obrigacaos/1
  # GET /obrigacaos/1.json
  def show
  end

  # GET /obrigacaos/new
  def new
    @obrigacao = Obrigacao.new
  end

  # GET /obrigacaos/1/edit
  def edit
  end

  # POST /obrigacaos
  # POST /obrigacaos.json
  def create
    @obrigacao = Obrigacao.new(obrigacao_params)

    respond_to do |format|
      if @obrigacao.save
        format.html { redirect_to @obrigacao, notice: 'Obrigacao was successfully created.' }
        format.json { render :show, status: :created, location: @obrigacao }
      else
        format.html { render :new }
        format.json { render json: @obrigacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /obrigacaos/1
  # PATCH/PUT /obrigacaos/1.json
  def update
    respond_to do |format|
      if @obrigacao.update(obrigacao_params)
        format.html { redirect_to @obrigacao, notice: 'Obrigacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @obrigacao }
      else
        format.html { render :edit }
        format.json { render json: @obrigacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /obrigacaos/1
  # DELETE /obrigacaos/1.json
  def destroy
    @obrigacao.destroy
    respond_to do |format|
      format.html { redirect_to obrigacaos_url, notice: 'Obrigacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_obrigacao
      @obrigacao = Obrigacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def obrigacao_params
      params.require(:obrigacao).permit(:cadastro_id, :flagrealizado)
    end
end
