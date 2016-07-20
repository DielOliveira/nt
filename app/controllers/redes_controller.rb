class RedesController < ApplicationController
 # before_action :requer_logon
  before_action :set_rede, only: [:show, :edit, :update, :destroy]

  # GET /redes
  # GET /redes.json
  def geralinha

    linhas = Rede.where("linha = " + (params[:numero].to_i - 1).to_s)

    linhas.each do |line|

      lineno = Rede.where("parent_id = " + line.id.to_s)

      if lineno.count == 0

        novarede = Rede.new
        novarede.parent_id = line.id
        novarede.linha = params[:numero]
        novarede.save

        novarede = Rede.new
        novarede.parent_id = line.id
        novarede.linha = params[:numero]
        novarede.save

      elsif lineno.count == 1
        
        novarede = Rede.new
        novarede.parent_id = line.id
        novarede.linha = params[:numero]
        novarede.save

      end 

    end



    render :json => linhas

  end

  def index
    @redes = Rede.all

    @linha1 = Rede.where("linha = 1")
    @linha1Preenchidos = Rede.where("linha = 1 and cadastro_id is not null")
    @linha2 = Rede.where("linha = 2")
    @linha2Preenchidos = Rede.where("linha = 2 and cadastro_id is not null") 
    @linha3 = Rede.where("linha = 3")
    @linha3Preenchidos = Rede.where("linha = 3 and cadastro_id is not null") 
    @linha4 = Rede.where("linha = 4")
    @linha4Preenchidos = Rede.where("linha = 4 and cadastro_id is not null") 
    @linha5 = Rede.where("linha = 5")
    @linha5Preenchidos = Rede.where("linha = 5 and cadastro_id is not null") 
    @linha6 = Rede.where("linha = 6")
    @linha6Preenchidos = Rede.where("linha = 6 and cadastro_id is not null") 
    @linha7 = Rede.where("linha = 7")
    @linha7Preenchidos = Rede.where("linha = 7 and cadastro_id is not null") 
    @linha8 = Rede.where("linha = 8")
    @linha8Preenchidos = Rede.where("linha = 8 and cadastro_id is not null") 
    @linha9 = Rede.where("linha = 9")
    @linha9Preenchidos = Rede.where("linha = 9 and cadastro_id is not null") 
    @linha10 = Rede.where("linha = 10")
    @linha10Preenchidos = Rede.where("linha = 10 and cadastro_id is not null") 
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
      params.require(:rede).permit(:desc, :redetipo_id, :cadastro_id, :parent_id, :linha)
    end
end
