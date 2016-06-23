class RedetiposController < ApplicationController
  before_action :set_redetipo, only: [:show, :edit, :update, :destroy]

  # GET /redetipos
  # GET /redetipos.json
  def index
    @redetipos = Redetipo.all
  end

  # GET /redetipos/1
  # GET /redetipos/1.json
  def show
  end

  # GET /redetipos/new
  def new
    @redetipo = Redetipo.new
  end

  # GET /redetipos/1/edit
  def edit
  end

  # POST /redetipos
  # POST /redetipos.json
  def create
    @redetipo = Redetipo.new(redetipo_params)

    respond_to do |format|
      if @redetipo.save
        format.html { redirect_to @redetipo, notice: 'Redetipo was successfully created.' }
        format.json { render :show, status: :created, location: @redetipo }
      else
        format.html { render :new }
        format.json { render json: @redetipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /redetipos/1
  # PATCH/PUT /redetipos/1.json
  def update
    respond_to do |format|
      if @redetipo.update(redetipo_params)
        format.html { redirect_to @redetipo, notice: 'Redetipo was successfully updated.' }
        format.json { render :show, status: :ok, location: @redetipo }
      else
        format.html { render :edit }
        format.json { render json: @redetipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /redetipos/1
  # DELETE /redetipos/1.json
  def destroy
    @redetipo.destroy
    respond_to do |format|
      format.html { redirect_to redetipos_url, notice: 'Redetipo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_redetipo
      @redetipo = Redetipo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def redetipo_params
      params.require(:redetipo).permit(:reentradaobrigatoria, :reentradas, :ordenada)
    end
end
