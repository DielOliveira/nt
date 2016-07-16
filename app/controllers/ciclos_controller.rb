class CiclosController < ApplicationController
  before_action :requer_logon
  before_action :set_ciclo, only: [:show, :edit, :update, :destroy]


  def upgrade_ciclo


      @doacoes = Doacao.joins('inner join ciclos cl on cl.id = ciclo_id').where("cadastro_1_id = " + user.cadastro.id.to_s + "and ciclo_id = " + params[:ciclo] + " and dataconfirmacao is not null" ).sum('valorciclo')

      if @doacoes == 0.0
          render :json => false
       else
          render :json => true
      end

  end


  def start_ciclo1

    rede = Rede.find_by_cadastro_id(user.cadastro.id)

    start = Doacao.new
    start.cadastro_1_id = user.cadastro.id
    start.cadastro_2_id = rede.parent.parent.id
    start.ciclo_id = 1
    start.flagenviada = false
    start.save

    render :json => start

  end


  def gerenciarciclos

    #@doacoes1 = Doacaos.joins('inner join fd_itempedidos ip on ip.id = fd_itempedido_id inner join fd_itensadicionals ia on fd_itensadicional_id = ia.id').where('ip.fd_pedido_id = ?', params[:fd_pedido_id])

      @doacoes1start = Doacao.joins('inner join ciclos cl on cl.id = ciclo_id').where("cadastro_1_id = " + user.cadastro.id.to_s + "and ciclo_id = 1" ).sum('valorciclo')
      @doacoes1 = Doacao.joins('inner join ciclos cl on cl.id = ciclo_id').where("cadastro_1_id = " + user.cadastro.id.to_s + "and ciclo_id = 1 and dataconfirmacao is not null" ).sum('valorciclo')
      @doacoes2 = Doacao.joins('inner join ciclos cl on cl.id = ciclo_id').where("cadastro_1_id = " + user.cadastro.id.to_s + "and ciclo_id = 2 and dataconfirmacao is not null" ).sum('valorciclo')
      @doacoes3 = Doacao.joins('inner join ciclos cl on cl.id = ciclo_id').where("cadastro_1_id = " + user.cadastro.id.to_s + "and ciclo_id = 3 and dataconfirmacao is not null" ).sum('valorciclo')
      @doacoes4 = Doacao.joins('inner join ciclos cl on cl.id = ciclo_id').where("cadastro_1_id = " + user.cadastro.id.to_s + "and ciclo_id = 4 and dataconfirmacao is not null" ).sum('valorciclo')
      @doacoes5 = Doacao.joins('inner join ciclos cl on cl.id = ciclo_id').where("cadastro_1_id = " + user.cadastro.id.to_s + "and ciclo_id = 5 and dataconfirmacao is not null" ).sum('valorciclo')
      @doacoes6 = Doacao.joins('inner join ciclos cl on cl.id = ciclo_id').where("cadastro_1_id = " + user.cadastro.id.to_s + "and ciclo_id = 6 and dataconfirmacao is not null" ).sum('valorciclo')

  end 

  
  # GET /ciclos
  # GET /ciclos.json
  def index
    @ciclos = Ciclo.all
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
