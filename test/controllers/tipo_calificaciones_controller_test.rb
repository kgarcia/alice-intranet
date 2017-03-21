require 'test_helper'

class TipoCalificacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_calificacion = tipo_calificaciones(:one)
  end

  test "should get index" do
    get tipo_calificaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_calificacion_url
    assert_response :success
  end

  test "should create tipo_calificacion" do
    assert_difference('TipoCalificacion.count') do
      post tipo_calificaciones_url, params: { tipo_calificacion: { descripcion: @tipo_calificacion.descripcion, estatus: @tipo_calificacion.estatus } }
    end

    assert_redirected_to tipo_calificacion_url(TipoCalificacion.last)
  end

  test "should show tipo_calificacion" do
    get tipo_calificacion_url(@tipo_calificacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_calificacion_url(@tipo_calificacion)
    assert_response :success
  end

  test "should update tipo_calificacion" do
    patch tipo_calificacion_url(@tipo_calificacion), params: { tipo_calificacion: { descripcion: @tipo_calificacion.descripcion, estatus: @tipo_calificacion.estatus } }
    assert_redirected_to tipo_calificacion_url(@tipo_calificacion)
  end

  test "should destroy tipo_calificacion" do
    assert_difference('TipoCalificacion.count', -1) do
      delete tipo_calificacion_url(@tipo_calificacion)
    end

    assert_redirected_to tipo_calificaciones_url
  end
end
