require 'test_helper'

class ParametrosControllerTest < ActionController::TestCase
  setup do
    @parametro = parametros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parametros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parametro" do
    assert_difference('Parametro.count') do
      post :create, parametro: { descripcion: @parametro.descripcion, estatus: @parametro.estatus }
    end

    assert_redirected_to parametro_path(assigns(:parametro))
  end

  test "should show parametro" do
    get :show, id: @parametro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parametro
    assert_response :success
  end

  test "should update parametro" do
    patch :update, id: @parametro, parametro: { descripcion: @parametro.descripcion, estatus: @parametro.estatus }
    assert_redirected_to parametro_path(assigns(:parametro))
  end

  test "should destroy parametro" do
    assert_difference('Parametro.count', -1) do
      delete :destroy, id: @parametro
    end

    assert_redirected_to parametros_path
  end
end
