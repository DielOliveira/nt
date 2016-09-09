#encoding: utf-8
class CadastrosController < ApplicationController
  before_action :set_cadastro, only: [:show, :edit, :update, :destroy]

  def convite
    usuario = Usuario.find_by_email(params[:login])
    if usuario
      session[:login] = usuario.email
    end

    @cadastro = Cadastro.new

  end

  def obrigareentrada

      cadastroprincipal = Cadastro.find(params[:cadastro_id])
      if cadastroprincipal.flagreentradaobrigatoria == true
        cadastroprincipal.flagreentradaobrigatoria = false
      else
        cadastroprincipal.flagreentradaobrigatoria = true
      end
      cadastroprincipal.email = cadastroprincipal.email
      cadastroprincipal.descconfirmaemail = cadastroprincipal.email
      cadastroprincipal.save    

      redirect_to cadastros_path

  end
  # GET /cadastros
  # GET /cadastros.json
  def index
    @cadastros = Cadastro.order(:created_at).all
  end

  # GET /cadastros/1
  # GET /cadastros/1.json
  def show
    @dadosfinanceiro =  Dadosfinanceiro.find_by_cadastro_id(@cadastro.id)
  end

  # GET /cadastros/new
  def new
    @cadastro = Cadastro.new
  end

  # GET /cadastros/1/edit
  def edit
  end

  # POST /cadastros
  # POST /cadastros.json
  def create
    @cadastro = Cadastro.new(cadastro_params)

    respond_to do |format|
      if @cadastro.save

          session[:cadastro_id] = @cadastro.id

          #rede = Rede.find_by_id(proximaentrada(1))
          #rede.cadastro_id = session[:cadastro_id]
          #rede.save

          padrinho = Usuario.find_by_email(@cadastro.cpfpadrinho)

          if not padrinho == nil

            indicado = Indicado.new
            indicado.cadastro_1_id = padrinho.cadastro_id
            indicado.cadastro_2_id = @cadastro.id
            indicado.save

          end

          format.html { redirect_to new_dadosfinanceiro_path, notice: 'Cadastro criado com sucesso.' }

      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /cadastros/1
  # PATCH/PUT /cadastros/1.json
  def update
    respond_to do |format|
      if @cadastro.update(cadastro_params)

        #byebug

        session[:cadastro_id] = @cadastro.id

        @dadosfinanceiros = Dadosfinanceiro.find_by_cadastro_id(@cadastro.id)
        
        if @dadosfinanceiros

          format.html { redirect_to edit_dadosfinanceiro_path(@dadosfinanceiros.id), notice: 'Cadastro criado com sucesso.' }
        else

          format.html { redirect_to new_dadosfinanceiro_path, notice: 'Cadastro criado com sucesso.' }
        end
        
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /cadastros/1
  # DELETE /cadastros/1.json
  def destroy

    rede = Rede.find_by_cadastro_id(@cadastro.id)
    if rede
      rede.cadastro_id = nil
      rede.save
    end

    reentradas = Reentrada.find_by_cadastro_adicionado_id(@cadastro.id)
    if reentradas
      reentradas.destroy
    end

    # doacaos = Doacao.where('cadastro_doador_id = ?',@cadastro.id)
    # if doacaos
    #   doacaos.each do |doacao|
    #     doacao.destroy
    #   end
    # end

    # doacaos = Doacao.where('cadastro_recebedor_id = ?',@cadastro.id)
    # if doacaos
    #   doacaos.each do |doacao|
    #     doacao.destroy
    #   end
    # end

    @cadastro.destroy
    respond_to do |format|
      format.html { redirect_to cadastros_url, notice: 'Cadastro excluído com sucesso.' }
      format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cadastro
      @cadastro = Cadastro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cadastro_params
      params.require(:cadastro).permit(:nomepessoa, :masculino, :email, :telefone, :operadora_id, :whatsapp, :skype, :facebook, :dadatainclusao, :cpf, :cpfpadrinho, :ciclo_id, :avatar, :flagreentrada, :flagativo, :descconfirmaemail, :contador, :flagreentradaobrigatoria)
    end
end
