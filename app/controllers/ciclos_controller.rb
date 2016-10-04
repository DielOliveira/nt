class CiclosController < ApplicationController
  before_action :requer_logon
  before_action :set_ciclo, only: [:show, :edit, :update, :destroy]


  def buscaReentradaDemanda(cadastro_id)
    begin

      obrigacaos = Obrigacao.where('cadastro_id = ? and flagrealizado =  false',user.cadastro.id)
      if not obrigacaos.blank?
        return true
      end
      
    rescue
      return false
    end
      return false
  end

  def buscaReentradaInativa(cadastro_id)
    
    begin
      cadastro = Cadastro.find(cadastro_id)
      reentradas = Reentrada.where('cadastro_reentrando_id = ? and ciclo_id = ? and flagopcional = false', cadastro.id, cadastro.ciclo.id)

      reentradas.each do |reentrada|
        if reentrada.cadastro_adicionado.flagativo == false
          return false      
        end
      end


    rescue
      return false
    end
      return true

  end



  def upgrade_ciclo

    begin
      cadastro = Cadastro.find(params[:cadastro_id])
      reentradas = Reentrada.where('cadastro_reentrando_id = ? and ciclo_id = ? and flagopcional = false', cadastro.id, cadastro.ciclo.id).count

      if  reentradas < cadastro.ciclo.qtdreentradas
          flash[:notice] = "Erro ao realizar o Upgrade. Você não possui reentradas suficiente."
          return redirect_to reentradas_path
      end

      if buscaReentradaInativa(cadastro.id) == false
          flash[:notice] = "Não é permitido o upgrade. Você possui reentradas inativas no sistema."
          return redirect_to reentradas_path
      end

      if buscaReentradaDemanda(cadastro.id) == true
          flash[:notice] = "Não é permitido o upgrade. Você possui reentradas obrigatórias a serem feitas."
          return redirect_to reentradas_path
      end      

      cadastro = Cadastro.find_by_id(cadastro.id)
      cadastro.ciclo_id = cadastro.ciclo_id + 1
      cadastro.save(:validate => false)

      rede = Rede.find_by_id(proximaentrada(cadastro.ciclo_id).to_i)
      rede.cadastro_id = cadastro.id
      rede.save

    rescue

      flash[:danger] = "Não foi possível salvar as informações. Contate o administrador"
      return redirect_to reentradas_path

    end

    flash[:success] = "Upgrade realizado com sucesso"
    redirect_to reentradas_path

  end
  
  # GET /ciclos
  # GET /ciclos.json
  def index

    if usuario_logado && user.cadastro_id == 1
        @ciclos = Ciclo.all
    else
        redirect_to root_path
    end

  end

  # GET /ciclos/1
  # GET /ciclos/1.json
  def show
  end

  # GET /ciclos/new
  def new
    @ciclo = Ciclo.new
  end

  # GET /ciclos/1/edit
  def edit
  end

  # POST /ciclos
  # POST /ciclos.json
  def create
    @ciclo = Ciclo.new(ciclo_params)

    respond_to do |format|
      if @ciclo.save
        format.html { redirect_to @ciclo, notice: 'Ciclo was successfully created.' }
        format.json { render :show, status: :created, location: @ciclo }
      else
        format.html { render :new }
        format.json { render json: @ciclo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ciclos/1
  # PATCH/PUT /ciclos/1.json
  def update
    respond_to do |format|
      if @ciclo.update(ciclo_params)
        format.html { redirect_to @ciclo, notice: 'Ciclo was successfully updated.' }
        format.json { render :show, status: :ok, location: @ciclo }
      else
        format.html { render :edit }
        format.json { render json: @ciclo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ciclos/1
  # DELETE /ciclos/1.json
  def destroy
    @ciclo.destroy
    respond_to do |format|
      format.html { redirect_to ciclos_url, notice: 'Ciclo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ciclo
      @ciclo = Ciclo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ciclo_params
      params.require(:ciclo).permit(:nomeciclo, :numerociclo, :valorciclo, :qtdreentradas)
    end
end
