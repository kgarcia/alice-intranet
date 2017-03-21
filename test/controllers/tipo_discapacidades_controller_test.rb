require 'test_helper'

class TipoDiscapacidadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_discapacidad = tipo_discapacidades(:one)
  end

  test "should get index" do
    get tipo_discapacidades_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_discapacidad_url
    assert_response :success
  end

  test "should create tipo_discapacidad" do
    assert_difference('TipoDiscapacidad.count') do
      post tipo_discapacidades_url, params: { tipo_discapacidad: { descripcion: @tipo_discapacidad.descripcion, estatus: @tipo_discapacidad.estatus } }
    end

    assert_redirected_to tipo_discapacidad_url(TipoDiscapacidad.last)
  end

  test "should show tipo_discapacidad" do
    get tipo_discapacidad_url(@tipo_discapacidad)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_discapacidad_url(@tipo_discapacidad)
    assert_response :success
  end

  test "should update tipo_discapacidad" do
    patch tipo_discapacidad_url(@tipo_discapacidad), params: { tipo_discapacidad: { descripcion: @tipo_discapacidad.descripcion, estatus: @tipo_discapacidad.estatus } }
    assert_redirected_to tipo_discapacidad_url(@tipo_discapacidad)
  end

  test "should destroy tipo_discapacidad" do
    assert_difference('TipoDiscapacidad.count', -1) do
      delete tipo_discapacidad_url(@tipo_discapacidad)
    end

    assert_redirected_to tipo_discapacidades_url
  end
end
