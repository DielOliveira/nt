class DoacaosController < ApplicationController
  before_action :requer_logon
  before_action :set_doacao, only: [:show, :edit, :update, :destroy, :confirmadoacao, :recusardoacao, :adiardoacao, :pausardoacao]

  # GET /doacaos
  # GET /doacaos.json


  def doacoesVencidas

    @doacaosVencendo = Doacao.where('tempo < ? and flagconfirmada = false', Time.now).order(:created_at)

  end

  def doacoesVencendo

    @doacaosVencendo = Doacao.where('tempo > ? and flagconfirmada = false', Time.now).order(:created_at)

  end


  def index
    @doacaos = Doacao.all.order(:id)
  end

  def doacoesrealizadas  
    @doacaos = Doacao.where("cadastro_doador_id =" + user.cadastro.id.to_s + "and flagenviada = true")
    @doacaoreentradas = Doacao.joins("inner join reentradas re on re.cadastro_adicionado_id = doacaos.cadastro_doador_id").where("re.cadastro_principal_id = " + user.cadastro.id.to_s + "and flagenviada = true")
  end

  def doacoesrecebidas  
    @doacaos = Doacao.where("cadastro_recebedor_id =" + user.cadastro.id.to_s + "and cadastro_doador_id is not null and dataconfirmacao is not null")
    @doacaosrecebidasreentradas = Doacao.joins("inner join reentradas re on re.cadastro_adicionado_id = doacaos.cadastro_recebedor_id").where("re.cadastro_principal_id = " + user.cadastro.id.to_s + "and flagenviada = true and dataconfirmacao is not null")
  end

  def doacoesareceber  
    @doacaospendentesreceber = Doacao.where("cadastro_recebedor_id =" + user.cadastro.id.to_s + "and flagenviada = true and dataconfirmacao is null")
    @doacaospendentesreceberreentradas = Doacao.joins("inner join reentradas re on re.cadastro_adicionado_id = doacaos.cadastro_recebedor_id").where("re.cadastro_principal_id = " + user.cadastro.id.to_s + "and flagenviada = true and dataconfirmacao is null")
  end    

  def confirmadoacao

    begin
      doacao = Doacao.find_by_id(@doacao.id)
      doacao.flagconfirmada = true
      doacao.dataconfirmacao = Time.now

      cadastro = Cadastro.find(doacao.cadastro_doador_id)
      cadastro.descconfirmaemail = cadastro.email
      cadastro.flagativo = true
    rescue
      flash[:danger] = "Não foi possível confirmar a doação. Contate o administrador."
      return redirect_to home_path
    end

    if doacao.save(:validate => false) && cadastro.save(:validate => false)
      flash[:success] = "Doação confirmada com sucesso."
    else
      flash[:danger] = "Não foi possível confirmar a doação. Contate o administrador."
    end

    redirect_to  home_path



  end

  def recusardoacao

    begin
      doacao = Doacao.find_by_id(@doacao.id)
      doacao.flagenviada = false
      doacao.dataconfirmacao = nil
      doacao.comprovante = nil
      doacao.avatar = nil
    rescue
      flash[:danger] = "Não foi possível recusar a doação. Contate o administrador."
      return redirect_to  home_path
    end

    if doacao.save(:validate => false)
      flash[:success] = "Doação recusada com sucesso."
    else
      flash[:danger] = "Não foi possível recusar a doação. Contate o administrador."
    end

    redirect_to  home_path

  end  

  def adiardoacao

    begin
      doacao = Doacao.find_by_id(@doacao.id)
      doacao.tempo = (doacao.tempo + 1.days)
    rescue
      flash[:danger] = "Não foi possível adiar a doação. Contate o administrador."
      return redirect_to home_path
    end
      
    if doacao.save(:validate => false)
      flash[:success] = "Doação adiada com sucesso."
    else
      flash[:danger] = "Não foi possível adiar a doação. Contate o administrador."
    end
      redirect_to  home_path 

  end


  def pausardoacao

    begin
      doacao = Doacao.find_by_id(@doacao.id)
      doacao.flagpause = !doacao.flagpause
    rescue
      flash[:danger] = "Não foi possível pausar/liberar a doação. Contate o administrador."
      redirect_to  doacaos_path    
    end

    if doacao.save(:validate => false)
      flash[:success] = "Doação pausada/liberada com sucesso."
    else
      flash[:danger] = "Não foi possível pausar/liberar a doação. Contate o administrador."
    end

    redirect_to  doacaos_path    

  end


  # GET /doacaos/1
  # GET /doacaos/1.json
  def show
  end

  # GET /doacaos/new
  def new
    @doacao = Doacao.new
  end

  # GET /doacaos/1/edit
  def edit
  end

  # POST /doacaos
  # POST /doacaos.json
  def create
    @doacao = Doacao.new(doacao_params)

    respond_to do |format|
      if @doacao.save
        format.html { redirect_to @doacao, notice: 'Doacao was successfully created.' }
        format.json { render :show, status: :created, location: @doacao }
      else
        format.html { render :new }
        format.json { render json: @doacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doacaos/1
  # PATCH/PUT /doacaos/1.json
  def update

    respond_to do |format|
      if @doacao.update(doacao_params)
        imagem = Cloudinary::Uploader.upload("public" + @doacao.avatar_url)

        @doacao.comprovante = imagem["public_id"] + "." + imagem["format"]
        @doacao.save
        format.html { redirect_to root_path, notice: 'Doacao was successfully updated.' }
        
      else
        format.html { render :edit }
        format.json { render json: @doacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doacaos/1
  # DELETE /doacaos/1.json
  def destroy
    @doacao.destroy
    respond_to do |format|
      format.html { redirect_to doacaos_url, notice: 'Doacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doacao
      @doacao = Doacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doacao_params
      params.require(:doacao).permit(:ciclo_id, :flagconfirmada, :flagrejeitada, :observacao, :dataconfirmacao, :flagenviada, :avatar, :comprovante, :tempo, :flagpause)
    end
end
