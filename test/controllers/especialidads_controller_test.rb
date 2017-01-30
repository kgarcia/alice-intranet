require 'test_helper'

class EspecialidadsControllerTest < ActionController::TestCase
  setup do
    @especialidad = especialidads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:especialidads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create especialidad" do
    assert_difference('Especialidad.count') do
      post :create, especialidad: { codigo: @especialidad.codigo, estatus: @especialidad.estatus, nombre: @especialidad.nombre }
    end

    assert_redirected_to especialidad_path(assigns(:especialidad))
  end

  test "should show especialidad" do
    get :show, id: @especialidad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @especialidad
    assert_response :success
  end

  test "should update especialidad" do
    patch :update, id: @especialidad, especialidad: { codigo: @especialidad.codigo, estatus: @especialidad.estatus, nombre: @especialidad.nombre }
    assert_redirected_to especialidad_path(assigns(:especialidad))
  end

  test "should destroy especialidad" do
    assert_difference('Especialidad.count', -1) do
      delete :destroy, id: @especialidad
    end

    assert_redirected_to especialidads_path
  end
end
