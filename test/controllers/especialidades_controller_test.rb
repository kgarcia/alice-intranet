require 'test_helper'

class EspecialidadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @especialidad = especialidades(:one)
  end

  test "should get index" do
    get especialidades_url
    assert_response :success
  end

  test "should get new" do
    get new_especialidad_url
    assert_response :success
  end

  test "should create especialidad" do
    assert_difference('Especialidad.count') do
      post especialidades_url, params: { especialidad: { descripcion: @especialidad.descripcion, estatus: @especialidad.estatus } }
    end

    assert_redirected_to especialidad_url(Especialidad.last)
  end

  test "should show especialidad" do
    get especialidad_url(@especialidad)
    assert_response :success
  end

  test "should get edit" do
    get edit_especialidad_url(@especialidad)
    assert_response :success
  end

  test "should update especialidad" do
    patch especialidad_url(@especialidad), params: { especialidad: { descripcion: @especialidad.descripcion, estatus: @especialidad.estatus } }
    assert_redirected_to especialidad_url(@especialidad)
  end

  test "should destroy especialidad" do
    assert_difference('Especialidad.count', -1) do
      delete especialidad_url(@especialidad)
    end

    assert_redirected_to especialidades_url
  end
end
