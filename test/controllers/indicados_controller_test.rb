require 'test_helper'

class IndicadosControllerTest < ActionController::TestCase
  setup do
    @indicado = indicados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:indicados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create indicado" do
    assert_difference('Indicado.count') do
      post :create, indicado: {  }
    end

    assert_redirected_to indicado_path(assigns(:indicado))
  end

  test "should show indicado" do
    get :show, id: @indicado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @indicado
    assert_response :success
  end

  test "should update indicado" do
    patch :update, id: @indicado, indicado: {  }
    assert_redirected_to indicado_path(assigns(:indicado))
  end

  test "should destroy indicado" do
    assert_difference('Indicado.count', -1) do
      delete :destroy, id: @indicado
    end

    assert_redirected_to indicados_path
  end
end
