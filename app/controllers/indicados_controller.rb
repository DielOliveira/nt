class IndicadosController < ApplicationController
  before_action :set_indicado, only: [:show, :edit, :update, :destroy]

  # GET /indicados
  # GET /indicados.json
  def index
    @indicados = Indicado.where(:cadastro_1_id => user.cadastro.id)
  end

  # GET /indicados/1
  # GET /indicados/1.json
  def show
  end

  # GET /indicados/new
  def new
    @indicado = Indicado.new
  end

  # GET /indicados/1/edit
  def edit
  end

  # POST /indicados
  # POST /indicados.json
  def create
    @indicado = Indicado.new(indicado_params)

    respond_to do |format|
      if @indicado.save
        format.html { redirect_to @indicado, notice: 'Indicado was successfully created.' }
        format.json { render :show, status: :created, location: @indicado }
      else
        format.html { render :new }
        format.json { render json: @indicado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /indicados/1
  # PATCH/PUT /indicados/1.json
  def update
    respond_to do |format|
      if @indicado.update(indicado_params)
        format.html { redirect_to @indicado, notice: 'Indicado was successfully updated.' }
        format.json { render :show, status: :ok, location: @indicado }
      else
        format.html { render :edit }
        format.json { render json: @indicado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indicados/1
  # DELETE /indicados/1.json
  def destroy
    @indicado.destroy
    respond_to do |format|
      format.html { redirect_to indicados_url, notice: 'Indicado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indicado
      @indicado = Indicado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def indicado_params
      params.fetch(:indicado, {})
    end
end