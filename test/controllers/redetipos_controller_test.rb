require 'test_helper'

class RedetiposControllerTest < ActionController::TestCase
  setup do
    @redetipo = redetipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:redetipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create redetipo" do
    assert_difference('Redetipo.count') do
      post :create, redetipo: { ordenada: @redetipo.ordenada, reentradaobrigatoria: @redetipo.reentradaobrigatoria, reentradas: @redetipo.reentradas }
    end

    assert_redirected_to redetipo_path(assigns(:redetipo))
  end

  test "should show redetipo" do
    get :show, id: @redetipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @redetipo
    assert_response :success
  end

  test "should update redetipo" do
    patch :update, id: @redetipo, redetipo: { ordenada: @redetipo.ordenada, reentradaobrigatoria: @redetipo.reentradaobrigatoria, reentradas: @redetipo.reentradas }
    assert_redirected_to redetipo_path(assigns(:redetipo))
  end

  test "should destroy redetipo" do
    assert_difference('Redetipo.count', -1) do
      delete :destroy, id: @redetipo
    end

    assert_redirected_to redetipos_path
  end
end
