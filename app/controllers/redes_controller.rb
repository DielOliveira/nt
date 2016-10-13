class RedesController < ApplicationController
 # before_action :requer_logon
  before_action :set_rede, only: [:show, :edit, :update, :destroy]

  def salvaOrdem

    rede = Rede.find_by_id(params[:id])

    rede.ordem = params[:ordem]
    rede.save

    render :json => rede

  end

  def buscaDadosRedes

    redes = Rede.where('id = ?', params[:id])

    redes_json = redes.map {|item| {:id => item.id, :cadastro_id => item.cadastro_id, :parent_id => item.parent_id, :linha => item.linha, :ordem => item.ordem}}
    render :json => redes_json

  end

  def redecontrole

    @redes = Rede.where('linha = ? and ciclo_id = ?', params[:linha], params[:ciclo_id]).order(:ordem)

  end

  def deletalinha
     redes = Rede.where("linha = " + params[:numero].to_s + ' and ciclo_id = ' + params[:ciclo_id] + ' and cadastro_id is null' )

    redes.each do |rede|
      rede.destroy
    end

    render :json => redes

  end


  def exibirlinhas

    @redes = Rede.where(:ciclo_id => params[:ciclo_id])

    @linha1 = Rede.where("linha = 1 and ciclo_id = " + params[:ciclo_id].to_s)
    @linha1Preenchidos = Rede.where("linha = 1 and cadastro_id is not null and ciclo_id = " + params[:ciclo_id].to_s)
    @linha2 = Rede.where("linha = 2 and ciclo_id = " + params[:ciclo_id].to_s)
    @linha2Preenchidos = Rede.where("linha = 2 and cadastro_id is not null and ciclo_id = " + params[:ciclo_id].to_s)
    @linha3 = Rede.where("linha = 3 and ciclo_id = " + params[:ciclo_id].to_s)
    @linha3Preenchidos = Rede.where("linha = 3 and cadastro_id is not null and ciclo_id = " + params[:ciclo_id].to_s)
    @linha4 = Rede.where("linha = 4 and ciclo_id = " + params[:ciclo_id].to_s)
    @linha4Preenchidos = Rede.where("linha = 4 and cadastro_id is not null and ciclo_id = " + params[:ciclo_id].to_s)
    @linha5 = Rede.where("linha = 5 and ciclo_id = " + params[:ciclo_id].to_s)
    @linha5Preenchidos = Rede.where("linha = 5 and cadastro_id is not null and ciclo_id = " + params[:ciclo_id].to_s)
    @linha6 = Rede.where("linha = 6 and ciclo_id = " + params[:ciclo_id].to_s)
    @linha6Preenchidos = Rede.where("linha = 6 and cadastro_id is not null and ciclo_id = " + params[:ciclo_id].to_s)
    @linha7 = Rede.where("linha = 7 and ciclo_id = " + params[:ciclo_id].to_s)
    @linha7Preenchidos = Rede.where("linha = 7 and cadastro_id is not null and ciclo_id = " + params[:ciclo_id].to_s)
    @linha8 = Rede.where("linha = 8 and ciclo_id = " + params[:ciclo_id].to_s)
    @linha8Preenchidos = Rede.where("linha = 8 and cadastro_id is not null and ciclo_id = " + params[:ciclo_id].to_s)
    @linha9 = Rede.where("linha = 9 and ciclo_id = " + params[:ciclo_id].to_s)
    @linha9Preenchidos = Rede.where("linha = 9 and cadastro_id is not null and ciclo_id = " + params[:ciclo_id].to_s)
    @linha10 = Rede.where("linha = 10 and ciclo_id = " + params[:ciclo_id].to_s)
    @linha10Preenchidos = Rede.where("linha = 10 and cadastro_id is not null and ciclo_id = " + params[:ciclo_id].to_s)
    @linha11 = Rede.where("linha = 11 and ciclo_id = " + params[:ciclo_id].to_s)
    @linha11Preenchidos = Rede.where("linha = 11 and cadastro_id is not null and ciclo_id = " + params[:ciclo_id].to_s)    

  end 

  
  # GET /redes
  # GET /redes.json
  def geralinha

    if params[:numero].to_s == '1'

      linha = Rede.where("linha = " + params[:numero].to_s + ' and ciclo_id = ' + params[:ciclo_id]).order(:ordem)

      if linha.count == 0
          novarede = Rede.new
          #novarede.parent_id = nil
          novarede.linha = params[:numero]
          novarede.ciclo_id = params[:ciclo_id]
          novarede.ordem = 1
          novarede.save
      else
          linha.first.ordem = 1
          linha.first.save
      end

    end
    
    linhas = Rede.where("linha = " + (params[:numero].to_i - 1).to_s + ' and ciclo_id = ' + params[:ciclo_id]).order(:ordem)

    count = 0

    linhas.each do |line|

    lineno = Rede.where("parent_id = " + line.id.to_s).order(:created_at)

    if lineno.count == 0

      count = count + 1
      novarede = Rede.new
      novarede.parent_id = line.id
      novarede.linha = params[:numero]
      novarede.ciclo_id = params[:ciclo_id]
      novarede.ordem = count
      novarede.save

      count = count + 1
      novarede = Rede.new
      novarede.parent_id = line.id
      novarede.linha = params[:numero]
      novarede.ciclo_id = params[:ciclo_id]
      novarede.ordem = count
      novarede.save

    elsif lineno.count == 1
      
      count = count + 1
      novarede = Rede.new
      novarede.parent_id = line.id
      novarede.linha = params[:numero]
      novarede.ciclo_id = params[:ciclo_id]
      novarede.ordem = count
      novarede.save

      count = count + 1
      lineno.first.ordem = count
      lineno.save

    elsif lineno.count == 2
      count = count + 1
      lineno.first.ordem = count
      lineno.first.save
      
      count = count + 1
      lineno.second.ordem = count
      lineno.second.save
    end

  end



    render :json => linhas

  end

  def index
    @ciclos = Ciclo.all
  end

  # GET /redes/1
  # GET /redes/1.json
  def show
  end

  # GET /redes/new
  def new
    @rede = Rede.new
  end

  # GET /redes/1/edit
  def edit
  end

  # POST /redes
  # POST /redes.json
  def create
    @rede = Rede.new(rede_params)

    respond_to do |format|
      if @rede.save
        format.html { redirect_to @rede, notice: 'Rede was successfully created.' }
        format.json { render :show, status: :created, location: @rede }
      else
        format.html { render :new }
        format.json { render json: @rede.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /redes/1
  # PATCH/PUT /redes/1.json
  def update
    respond_to do |format|
      if @rede.update(rede_params)
        format.html { redirect_to @rede, notice: 'Rede was successfully updated.' }
        format.json { render :show, status: :ok, location: @rede }
      else
        format.html { render :edit }
        format.json { render json: @rede.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /redes/1
  # DELETE /redes/1.json
  def destroy
    @rede.destroy
    respond_to do |format|
      format.html { redirect_to redes_url, notice: 'Rede was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rede
      @rede = Rede.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rede_params
      params.require(:rede).permit(:desc, :redetipo_id, :cadastro_id, :parent_id, :linha, :ordem)
    end
end
