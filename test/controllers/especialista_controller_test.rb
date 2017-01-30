require 'test_helper'

class EspecialistaControllerTest < ActionController::TestCase
  setup do
    @especialistum = especialista(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:especialista)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create especialistum" do
    assert_difference('Especialistum.count') do
      post :create, especialistum: { apellido: @especialistum.apellido, cedula: @especialistum.cedula, curriculum: @especialistum.curriculum, edad: @especialistum.edad, especialidad_id: @especialistum.especialidad_id, fecha_ingreso: @especialistum.fecha_ingreso, nombre: @especialistum.nombre, sexo_id: @especialistum.sexo_id }
    end

    assert_redirected_to especialistum_path(assigns(:especialistum))
  end

  test "should show especialistum" do
    get :show, id: @especialistum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @especialistum
    assert_response :success
  end

  test "should update especialistum" do
    patch :update, id: @especialistum, especialistum: { apellido: @especialistum.apellido, cedula: @especialistum.cedula, curriculum: @especialistum.curriculum, edad: @especialistum.edad, especialidad_id: @especialistum.especialidad_id, fecha_ingreso: @especialistum.fecha_ingreso, nombre: @especialistum.nombre, sexo_id: @especialistum.sexo_id }
    assert_redirected_to especialistum_path(assigns(:especialistum))
  end

  test "should destroy especialistum" do
    assert_difference('Especialistum.count', -1) do
      delete :destroy, id: @especialistum
    end

    assert_redirected_to especialista_path
  end
end
