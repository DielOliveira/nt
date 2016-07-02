class ContabancariatiposController < ApplicationController
  before_action :requer_logon
  before_action :set_contabancariatipo, only: [:show, :edit, :update, :destroy]

  # GET /contabancariatipos
  # GET /contabancariatipos.json
  def index
    @contabancariatipos = Contabancariatipo.all
  end

  # GET /contabancariatipos/1
  # GET /contabancariatipos/1.json
  def show
  end

  # GET /contabancariatipos/new
  def new
    @contabancariatipo = Contabancariatipo.new
  end

  # GET /contabancariatipos/1/edit
  def edit
  end

  # POST /contabancariatipos
  # POST /contabancariatipos.json
  def create
    @contabancariatipo = Contabancariatipo.new(contabancariatipo_params)

    respond_to do |format|
      if @contabancariatipo.save
        format.html { redirect_to @contabancariatipo, notice: 'Contabancariatipo was successfully created.' }
        format.json { render :show, status: :created, location: @contabancariatipo }
      else
        format.html { render :new }
        format.json { render json: @contabancariatipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contabancariatipos/1
  # PATCH/PUT /contabancariatipos/1.json
  def update
    respond_to do |format|
      if @contabancariatipo.update(contabancariatipo_params)
        format.html { redirect_to @contabancariatipo, notice: 'Contabancariatipo was successfully updated.' }
        format.json { render :show, status: :ok, location: @contabancariatipo }
      else
        format.html { render :edit }
        format.json { render json: @contabancariatipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contabancariatipos/1
  # DELETE /contabancariatipos/1.json
  def destroy
    @contabancariatipo.destroy
    respond_to do |format|
      format.html { redirect_to contabancariatipos_url, notice: 'Contabancariatipo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contabancariatipo
      @contabancariatipo = Contabancariatipo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contabancariatipo_params
      params.require(:contabancariatipo).permit(:nometipo)
    end
end
