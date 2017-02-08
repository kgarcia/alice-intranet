require 'test_helper'

class HabitosControllerTest < ActionController::TestCase
  setup do
    @habito = habitos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:habitos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create habito" do
    assert_difference('Habito.count') do
      post :create, habito: { descripcion: @habito.descripcion, estatus: @habito.estatus }
    end

    assert_redirected_to habito_path(assigns(:habito))
  end

  test "should show habito" do
    get :show, id: @habito
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @habito
    assert_response :success
  end

  test "should update habito" do
    patch :update, id: @habito, habito: { descripcion: @habito.descripcion, estatus: @habito.estatus }
    assert_redirected_to habito_path(assigns(:habito))
  end

  test "should destroy habito" do
    assert_difference('Habito.count', -1) do
      delete :destroy, id: @habito
    end

    assert_redirected_to habitos_path
  end
end
