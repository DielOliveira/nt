class TipocontaController < ApplicationController
  before_action :set_tipocontum, only: [:show, :edit, :update, :destroy]

  # GET /tipoconta
  # GET /tipoconta.json
  def index
    @tipoconta = Tipocontum.all
  end

  # GET /tipoconta/1
  # GET /tipoconta/1.json
  def show
  end

  # GET /tipoconta/new
  def new
    @tipocontum = Tipocontum.new
  end

  # GET /tipoconta/1/edit
  def edit
  end

  # POST /tipoconta
  # POST /tipoconta.json
  def create
    @tipocontum = Tipocontum.new(tipocontum_params)

    respond_to do |format|
      if @tipocontum.save
        format.html { redirect_to @tipocontum, notice: 'Tipocontum was successfully created.' }
        format.json { render :show, status: :created, location: @tipocontum }
      else
        format.html { render :new }
        format.json { render json: @tipocontum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipoconta/1
  # PATCH/PUT /tipoconta/1.json
  def update
    respond_to do |format|
      if @tipocontum.update(tipocontum_params)
        format.html { redirect_to @tipocontum, notice: 'Tipocontum was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipocontum }
      else
        format.html { render :edit }
        format.json { render json: @tipocontum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipoconta/1
  # DELETE /tipoconta/1.json
  def destroy
    @tipocontum.destroy
    respond_to do |format|
      format.html { redirect_to tipoconta_url, notice: 'Tipocontum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipocontum
      @tipocontum = Tipocontum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipocontum_params
      params.require(:tipocontum).permit(:nometipo)
    end
end
