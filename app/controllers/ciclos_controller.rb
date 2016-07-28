class CiclosController < ApplicationController
  before_action :requer_logon
  before_action :set_ciclo, only: [:show, :edit, :update, :destroy]


  def upgrade_ciclo

      cadastro = Cadastro.find(params[:cadastro_id])

      @reentradas = Reentrada.where("cadastro_reentrando_id = " + params[:cadastro_id].to_s + ' and ciclo_id = ' + cadastro.ciclo.id.to_s).count

      if cadastro.ciclo.qtdreentradas < @reentradas
            return
      end

      cadastro = Cadastro.find_by_id(cadastro.id)
      cadastro.cpfpadrinho = cadastro.email
      cadastro.ciclo_id = cadastro.ciclo_id + 1

      respond_to do |format|
        if cadastro.save
            format.html { redirect_to reentradas_path, notice: 'Upgrade realizado com sucesso.' }
        else
            format.html { redirect_to reentradas_path, notice: 'Erro ao realizar o Upgrade.' }
        end
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

      rede = Rede.find_by_cadastro_id(user.cadastro.id)
  
      if rede.linha <= 2
        @redepermite = false
      else
        @redepermite = true
      end    

    #@doacoes1 = Doacaos.joins('inner join fd_itempedidos ip on ip.id = fd_itempedido_id inner join fd_itensadicionals ia on fd_itensadicional_id = ia.id').where('ip.fd_pedido_id = ?', params[:fd_pedido_id])

      @doacoes1start = Doacao.joins('inner join ciclos cl on cl.id = ciclo_id').where("cadastro_1_id = " + user.cadastro.id.to_s + "and ciclo_id = 1" ).sum('valorciclo')
      @doacoes1 = Doacao.joins('inner join ciclos cl on cl.id = ciclo_id').where("cadastro_1_id = " + user.cadastro.id.to_s + "and ciclo_id = 1 and dataconfirmacao is not null" ).sum('valorciclo')
      @doacoes2 = Doacao.joins('inner join ciclos cl on cl.id = ciclo_id').where("cadastro_1_id = " + user.cadastro.id.to_s + "and ciclo_id = 2 and dataconfirmacao is not null" ).sum('valorciclo')
      @doacoes3 = Doacao.joins('inner join ciclos cl on cl.id = ciclo_id').where("cadastro_1_id = " + user.cadastro.id.to_s + "and ciclo_id = 3 and dataconfirmacao is not null" ).sum('valorciclo')
      @doacoes4 = Doacao.joins('inner join ciclos cl on cl.id = ciclo_id').where("cadastro_1_id = " + user.cadastro.id.to_s + "and ciclo_id = 4 and dataconfirmacao is not null" ).sum('valorciclo')
      @doacoes5 = Doacao.joins('inner join ciclos cl on cl.id = ciclo_id').where("cadastro_1_id = " + user.cadastro.id.to_s + "and ciclo_id = 5 and dataconfirmacao is not null" ).sum('valorciclo')
      @doacoes6 = Doacao.joins('inner join ciclos cl on cl.id = ciclo_id').where("cadastro_1_id = " + user.cadastro.id.to_s + "and ciclo_id = 6 and dataconfirmacao is not null" ).sum('valorciclo')

      @reentradas = Reentrada.where("cadastro_1_id = " + user.cadastro.id.to_s).count

      if @reentradas >= 1
        @reentradas1 = 1
      else
        @reentradas1 = 0
      end

      if @reentradas >= 2
        @reentradas2 = 1
      else
        @reentradas2 = 0
      end

      if @reentradas >= 5
        @reentradas3 = 3
      elsif @reentradas > 2
        @reentradas3 = (@reentradas -2)
      elsif @reentradas <= 2
        @reentradas3 = 0
      end

      if @reentradas >= 15
        @reentradas4 = 10
      elsif @reentradas > 5
        @reentradas4 = (@reentradas -5)
      elsif @reentradas <= 5
        @reentradas4 = 0
      end

      if @reentradas >= 35
        @reentradas5 = 20
      elsif @reentradas > 15
        @reentradas5 = (@reentradas -15)
      elsif @reentradas <= 15
        @reentradas5 = 0
      end 

      if @reentradas >= 85
        @reentradas6 = 50
      elsif @reentradas > 35
        @reentradas6 = (@reentradas -35)
      elsif @reentradas <= 35
        @reentradas6 = 0
      end                    


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
