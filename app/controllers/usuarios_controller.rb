#encoding: utf-8
class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  #before_action :requer_logon, only: [:show, :edit, :update, :destroy]

  # GET /usuarios
  # GET /usuarios.json
  def index
    if usuario_logado && user.cadastro_id == 1
        @usuarios = Usuario.all
    else
        redirect_to root_path
    end

  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  def checksum(cadastro_id)


    cadastro = Cadastro.find_by_id(cadastro_id)

    dadosfinanceiros = Dadosfinanceiro.find_by_cadastro_id(cadastro_id)
    
    if (cadastro && dadosfinanceiros)
      return true
    else
      return false
    end

  end

  # POST /usuarios
  # POST /usuarios.json
  def create

    begin 

      @usuario = Usuario.new(usuario_params)
      @usuario.cadastro_id = session[:cadastro_id]
      @usuario.datainclusao = Time.now
      @usuario.flagativo = false
      
    rescue
      flash[:danger] = "Não foi possível salvar as informações. Contate o administrador1"
      return  redirect_to new_usuario_path 
    end

    respond_to do |format|
      if @usuario.save

        session[:ObjLogon] = Usuario.where(:email => @usuario.email, :senha => @usuario.senha)
        session[:ObjLogon] = session[:ObjLogon].first

        format.html { redirect_to home_path, notice: 'Usuário criado com sucesso.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to root_path, notice: 'Usuario alterado com sucesso.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario

      if usuario_logado && user.cadastro_id == 1
        @usuario = Usuario.find(params[:id])
      else
        params[:id] = user.id
        @usuario = Usuario.find(params[:id])
      end
            
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:email, :senha, :cadastro_id, :datainclusao, :dataultimologin, :flagativo, :descconfirmasenha)
    end
end
