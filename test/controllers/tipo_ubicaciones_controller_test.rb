require 'test_helper'

class TipoUbicacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_ubicacion = tipo_ubicaciones(:one)
  end

  test "should get index" do
    get tipo_ubicaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_ubicacion_url
    assert_response :success
  end

  test "should create tipo_ubicacion" do
    assert_difference('TipoUbicacion.count') do
      post tipo_ubicaciones_url, params: { tipo_ubicacion: { descripcion: @tipo_ubicacion.descripcion, estatus: @tipo_ubicacion.estatus } }
    end

    assert_redirected_to tipo_ubicacion_url(TipoUbicacion.last)
  end

  test "should show tipo_ubicacion" do
    get tipo_ubicacion_url(@tipo_ubicacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_ubicacion_url(@tipo_ubicacion)
    assert_response :success
  end

  test "should update tipo_ubicacion" do
    patch tipo_ubicacion_url(@tipo_ubicacion), params: { tipo_ubicacion: { descripcion: @tipo_ubicacion.descripcion, estatus: @tipo_ubicacion.estatus } }
    assert_redirected_to tipo_ubicacion_url(@tipo_ubicacion)
  end

  test "should destroy tipo_ubicacion" do
    assert_difference('TipoUbicacion.count', -1) do
      delete tipo_ubicacion_url(@tipo_ubicacion)
    end

    assert_redirected_to tipo_ubicaciones_url
  end
end
