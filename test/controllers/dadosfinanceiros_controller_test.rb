require 'test_helper'

class DadosfinanceirosControllerTest < ActionController::TestCase
  setup do
    @dadosfinanceiro = dadosfinanceiros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dadosfinanceiros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dadosfinanceiro" do
    assert_difference('Dadosfinanceiro.count') do
      post :create, dadosfinanceiro: { agencia: @dadosfinanceiro.agencia, banco_id: @dadosfinanceiro.banco_id, codigo: @dadosfinanceiro.codigo, contabancariatipo_id: @dadosfinanceiro.contabancariatipo_id, cpftitular: @dadosfinanceiro.cpftitular, datainclulsao: @dadosfinanceiro.datainclulsao, emailsuperconta: @dadosfinanceiro.emailsuperconta, nometitular: @dadosfinanceiro.nometitular, observacao: @dadosfinanceiro.observacao, operacao: @dadosfinanceiro.operacao }
    end

    assert_redirected_to dadosfinanceiro_path(assigns(:dadosfinanceiro))
  end

  test "should show dadosfinanceiro" do
    get :show, id: @dadosfinanceiro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dadosfinanceiro
    assert_response :success
  end

  test "should update dadosfinanceiro" do
    patch :update, id: @dadosfinanceiro, dadosfinanceiro: { agencia: @dadosfinanceiro.agencia, banco_id: @dadosfinanceiro.banco_id, codigo: @dadosfinanceiro.codigo, contabancariatipo_id: @dadosfinanceiro.contabancariatipo_id, cpftitular: @dadosfinanceiro.cpftitular, datainclulsao: @dadosfinanceiro.datainclulsao, emailsuperconta: @dadosfinanceiro.emailsuperconta, nometitular: @dadosfinanceiro.nometitular, observacao: @dadosfinanceiro.observacao, operacao: @dadosfinanceiro.operacao }
    assert_redirected_to dadosfinanceiro_path(assigns(:dadosfinanceiro))
  end

  test "should destroy dadosfinanceiro" do
    assert_difference('Dadosfinanceiro.count', -1) do
      delete :destroy, id: @dadosfinanceiro
    end

    assert_redirected_to dadosfinanceiros_path
  end
end
