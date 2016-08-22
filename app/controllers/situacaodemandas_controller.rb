class SituacaodemandasController < ApplicationController
  before_action :set_situacaodemanda, only: [:show, :edit, :update, :destroy]

  # GET /situacaodemandas
  # GET /situacaodemandas.json
  def index
    @situacaodemandas = Situacaodemanda.all
  end

  # GET /situacaodemandas/1
  # GET /situacaodemandas/1.json
  def show
  end

  # GET /situacaodemandas/new
  def new
    @situacaodemanda = Situacaodemanda.new
  end

  # GET /situacaodemandas/1/edit
  def edit
  end

  # POST /situacaodemandas
  # POST /situacaodemandas.json
  def create
    @situacaodemanda = Situacaodemanda.new(situacaodemanda_params)

    respond_to do |format|
      if @situacaodemanda.save
        format.html { redirect_to @situacaodemanda, notice: 'Situacaodemanda was successfully created.' }
        format.json { render :show, status: :created, location: @situacaodemanda }
      else
        format.html { render :new }
        format.json { render json: @situacaodemanda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /situacaodemandas/1
  # PATCH/PUT /situacaodemandas/1.json
  def update
    respond_to do |format|
      if @situacaodemanda.update(situacaodemanda_params)
        format.html { redirect_to @situacaodemanda, notice: 'Situacaodemanda was successfully updated.' }
        format.json { render :show, status: :ok, location: @situacaodemanda }
      else
        format.html { render :edit }
        format.json { render json: @situacaodemanda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /situacaodemandas/1
  # DELETE /situacaodemandas/1.json
  def destroy
    @situacaodemanda.destroy
    respond_to do |format|
      format.html { redirect_to situacaodemandas_url, notice: 'Situacaodemanda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_situacaodemanda
      @situacaodemanda = Situacaodemanda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def situacaodemanda_params
      params.require(:situacaodemanda).permit(:descricao)
    end
end
