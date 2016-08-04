class AssuntosController < ApplicationController
  before_action :set_assunto, only: [:show, :edit, :update, :destroy]

  # GET /assuntos
  # GET /assuntos.json
  def index
    @assuntos = Assunto.all
  end

  # GET /assuntos/1
  # GET /assuntos/1.json
  def show
  end

  # GET /assuntos/new
  def new
    @assunto = Assunto.new
  end

  # GET /assuntos/1/edit
  def edit
  end

  # POST /assuntos
  # POST /assuntos.json
  def create
    @assunto = Assunto.new(assunto_params)

    respond_to do |format|
      if @assunto.save
        format.html { redirect_to @assunto, notice: 'Assunto was successfully created.' }
        format.json { render :show, status: :created, location: @assunto }
      else
        format.html { render :new }
        format.json { render json: @assunto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assuntos/1
  # PATCH/PUT /assuntos/1.json
  def update
    respond_to do |format|
      if @assunto.update(assunto_params)
        format.html { redirect_to @assunto, notice: 'Assunto was successfully updated.' }
        format.json { render :show, status: :ok, location: @assunto }
      else
        format.html { render :edit }
        format.json { render json: @assunto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assuntos/1
  # DELETE /assuntos/1.json
  def destroy
    @assunto.destroy
    respond_to do |format|
      format.html { redirect_to assuntos_url, notice: 'Assunto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assunto
      @assunto = Assunto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assunto_params
      params.require(:assunto).permit(:assunto)
    end
end
