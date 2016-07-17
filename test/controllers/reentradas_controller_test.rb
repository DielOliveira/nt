require 'test_helper'

class ReentradasControllerTest < ActionController::TestCase
  setup do
    @reentrada = reentradas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reentradas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reentrada" do
    assert_difference('Reentrada.count') do
      post :create, reentrada: {  }
    end

    assert_redirected_to reentrada_path(assigns(:reentrada))
  end

  test "should show reentrada" do
    get :show, id: @reentrada
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reentrada
    assert_response :success
  end

  test "should update reentrada" do
    patch :update, id: @reentrada, reentrada: {  }
    assert_redirected_to reentrada_path(assigns(:reentrada))
  end

  test "should destroy reentrada" do
    assert_difference('Reentrada.count', -1) do
      delete :destroy, id: @reentrada
    end

    assert_redirected_to reentradas_path
  end
end
