require 'test_helper'

class TipocontaControllerTest < ActionController::TestCase
  setup do
    @tipocontum = tipoconta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipoconta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipocontum" do
    assert_difference('Tipocontum.count') do
      post :create, tipocontum: { nometipo: @tipocontum.nometipo }
    end

    assert_redirected_to tipocontum_path(assigns(:tipocontum))
  end

  test "should show tipocontum" do
    get :show, id: @tipocontum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipocontum
    assert_response :success
  end

  test "should update tipocontum" do
    patch :update, id: @tipocontum, tipocontum: { nometipo: @tipocontum.nometipo }
    assert_redirected_to tipocontum_path(assigns(:tipocontum))
  end

  test "should destroy tipocontum" do
    assert_difference('Tipocontum.count', -1) do
      delete :destroy, id: @tipocontum
    end

    assert_redirected_to tipoconta_path
  end
end
