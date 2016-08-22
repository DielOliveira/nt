require 'test_helper'

class SituacaodemandasControllerTest < ActionController::TestCase
  setup do
    @situacaodemanda = situacaodemandas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:situacaodemandas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create situacaodemanda" do
    assert_difference('Situacaodemanda.count') do
      post :create, situacaodemanda: { descricao: @situacaodemanda.descricao }
    end

    assert_redirected_to situacaodemanda_path(assigns(:situacaodemanda))
  end

  test "should show situacaodemanda" do
    get :show, id: @situacaodemanda
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @situacaodemanda
    assert_response :success
  end

  test "should update situacaodemanda" do
    patch :update, id: @situacaodemanda, situacaodemanda: { descricao: @situacaodemanda.descricao }
    assert_redirected_to situacaodemanda_path(assigns(:situacaodemanda))
  end

  test "should destroy situacaodemanda" do
    assert_difference('Situacaodemanda.count', -1) do
      delete :destroy, id: @situacaodemanda
    end

    assert_redirected_to situacaodemandas_path
  end
end
