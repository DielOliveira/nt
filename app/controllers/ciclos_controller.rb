class CiclosController < ApplicationController
  before_action :requer_logon
  before_action :set_ciclo, only: [:show, :edit, :update, :destroy]


  def upgrade_ciclo

    begin
      cadastro = Cadastro.find(params[:cadastro_id])
      @reentradas = Reentrada.where("cadastro_reentrando_id = " + params[:cadastro_id].to_s + ' and ciclo_id = ' + cadastro.ciclo.id.to_s).count
      @permite = true

      if  @reentradas < cadastro.ciclo.qtdreentradas
          flash[:notice] = "Erro ao realizar o Upgrade. Verifique se possui reentradas suficiente."
          return redirect_to reentradas_path
      end


      cadastro = Cadastro.find_by_id(cadastro.id)
      cadastro.ciclo_id = cadastro.ciclo_id + 1
      cadastro.save(:validate => false)

      rede = Rede.find_by_id(proximaentrada(cadastro.ciclo_id).to_i)
      rede.cadastro_id = cadastro.id
      rede.save

    rescue

      if cadastro
        cadastro.ciclo_id = cadastro.ciclo_id - 1
        cadastro.save(:validate => false)
      end

      if rede
        rede.cadastro_id = nil
        rede.save
      end

      flash[:danger] = "Não foi possível salvar as informações. Contate o administrador"
      return redirect_to reentradas_path
    
    ensure

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
