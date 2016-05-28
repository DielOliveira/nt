require 'test_helper'

class ContabancariatiposControllerTest < ActionController::TestCase
  setup do
    @contabancariatipo = contabancariatipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contabancariatipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contabancariatipo" do
    assert_difference('Contabancariatipo.count') do
      post :create, contabancariatipo: { nometipo: @contabancariatipo.nometipo }
    end

    assert_redirected_to contabancariatipo_path(assigns(:contabancariatipo))
  end

  test "should show contabancariatipo" do
    get :show, id: @contabancariatipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contabancariatipo
    assert_response :success
  end

  test "should update contabancariatipo" do
    patch :update, id: @contabancariatipo, contabancariatipo: { nometipo: @contabancariatipo.nometipo }
    assert_redirected_to contabancariatipo_path(assigns(:contabancariatipo))
  end

  test "should destroy contabancariatipo" do
    assert_difference('Contabancariatipo.count', -1) do
      delete :destroy, id: @contabancariatipo
    end

    assert_redirected_to contabancariatipos_path
  end
end
