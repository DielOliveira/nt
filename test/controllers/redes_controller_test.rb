require 'test_helper'

class RedesControllerTest < ActionController::TestCase
  setup do
    @rede = redes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:redes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rede" do
    assert_difference('Rede.count') do
      post :create, rede: { desc: @rede.desc, parent_id: @rede.parent_id, redetipo_id: @rede.redetipo_id, usuario_id: @rede.usuario_id }
    end

    assert_redirected_to rede_path(assigns(:rede))
  end

  test "should show rede" do
    get :show, id: @rede
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rede
    assert_response :success
  end

  test "should update rede" do
    patch :update, id: @rede, rede: { desc: @rede.desc, parent_id: @rede.parent_id, redetipo_id: @rede.redetipo_id, usuario_id: @rede.usuario_id }
    assert_redirected_to rede_path(assigns(:rede))
  end

  test "should destroy rede" do
    assert_difference('Rede.count', -1) do
      delete :destroy, id: @rede
    end

    assert_redirected_to redes_path
  end
end
