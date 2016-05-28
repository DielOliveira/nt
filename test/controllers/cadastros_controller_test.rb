require 'test_helper'

class CadastrosControllerTest < ActionController::TestCase
  setup do
    @cadastro = cadastros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cadastros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cadastro" do
    assert_difference('Cadastro.count') do
      post :create, cadastro: { dadatainclusao: @cadastro.dadatainclusao, dadosfinanceiro_id: @cadastro.dadosfinanceiro_id, email: @cadastro.email, facebook: @cadastro.facebook, masculino: @cadastro.masculino, nomepessoa: @cadastro.nomepessoa, operadora_id: @cadastro.operadora_id, skype: @cadastro.skype, telefone: @cadastro.telefone, whatsapp: @cadastro.whatsapp }
    end

    assert_redirected_to cadastro_path(assigns(:cadastro))
  end

  test "should show cadastro" do
    get :show, id: @cadastro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cadastro
    assert_response :success
  end

  test "should update cadastro" do
    patch :update, id: @cadastro, cadastro: { dadatainclusao: @cadastro.dadatainclusao, dadosfinanceiro_id: @cadastro.dadosfinanceiro_id, email: @cadastro.email, facebook: @cadastro.facebook, masculino: @cadastro.masculino, nomepessoa: @cadastro.nomepessoa, operadora_id: @cadastro.operadora_id, skype: @cadastro.skype, telefone: @cadastro.telefone, whatsapp: @cadastro.whatsapp }
    assert_redirected_to cadastro_path(assigns(:cadastro))
  end

  test "should destroy cadastro" do
    assert_difference('Cadastro.count', -1) do
      delete :destroy, id: @cadastro
    end

    assert_redirected_to cadastros_path
  end
end
