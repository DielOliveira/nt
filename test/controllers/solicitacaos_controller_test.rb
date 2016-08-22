require 'test_helper'

class SolicitacaosControllerTest < ActionController::TestCase
  setup do
    @solicitacao = solicitacaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:solicitacaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create solicitacao" do
    assert_difference('Solicitacao.count') do
      post :create, solicitacao: { anexo: @solicitacao.anexo, dataprevisao: @solicitacao.dataprevisao, descricao: @solicitacao.descricao, resolucao: @solicitacao.resolucao, situacaodemanda_id: @solicitacao.situacaodemanda_id, titulo: @solicitacao.titulo }
    end

    assert_redirected_to solicitacao_path(assigns(:solicitacao))
  end

  test "should show solicitacao" do
    get :show, id: @solicitacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @solicitacao
    assert_response :success
  end

  test "should update solicitacao" do
    patch :update, id: @solicitacao, solicitacao: { anexo: @solicitacao.anexo, dataprevisao: @solicitacao.dataprevisao, descricao: @solicitacao.descricao, resolucao: @solicitacao.resolucao, situacaodemanda_id: @solicitacao.situacaodemanda_id, titulo: @solicitacao.titulo }
    assert_redirected_to solicitacao_path(assigns(:solicitacao))
  end

  test "should destroy solicitacao" do
    assert_difference('Solicitacao.count', -1) do
      delete :destroy, id: @solicitacao
    end

    assert_redirected_to solicitacaos_path
  end
end
