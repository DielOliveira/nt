require 'test_helper'

class ObrigacaosControllerTest < ActionController::TestCase
  setup do
    @obrigacao = obrigacaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:obrigacaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create obrigacao" do
    assert_difference('Obrigacao.count') do
      post :create, obrigacao: { cadastro_id: @obrigacao.cadastro_id, flagrealizado: @obrigacao.flagrealizado }
    end

    assert_redirected_to obrigacao_path(assigns(:obrigacao))
  end

  test "should show obrigacao" do
    get :show, id: @obrigacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @obrigacao
    assert_response :success
  end

  test "should update obrigacao" do
    patch :update, id: @obrigacao, obrigacao: { cadastro_id: @obrigacao.cadastro_id, flagrealizado: @obrigacao.flagrealizado }
    assert_redirected_to obrigacao_path(assigns(:obrigacao))
  end

  test "should destroy obrigacao" do
    assert_difference('Obrigacao.count', -1) do
      delete :destroy, id: @obrigacao
    end

    assert_redirected_to obrigacaos_path
  end
end
