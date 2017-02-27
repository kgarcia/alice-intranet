require 'test_helper'

class NotificacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notificacion = notificaciones(:one)
  end

  test "should get index" do
    get notificaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_notificacion_url
    assert_response :success
  end

  test "should create notificacion" do
    assert_difference('Notificacion.count') do
      post notificaciones_url, params: { notificacion: { descripcion: @notificacion.descripcion, estatus: @notificacion.estatus, tipo_notificacion_id: @notificacion.tipo_notificacion_id } }
    end

    assert_redirected_to notificacion_url(Notificacion.last)
  end

  test "should show notificacion" do
    get notificacion_url(@notificacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_notificacion_url(@notificacion)
    assert_response :success
  end

  test "should update notificacion" do
    patch notificacion_url(@notificacion), params: { notificacion: { descripcion: @notificacion.descripcion, estatus: @notificacion.estatus, tipo_notificacion_id: @notificacion.tipo_notificacion_id } }
    assert_redirected_to notificacion_url(@notificacion)
  end

  test "should destroy notificacion" do
    assert_difference('Notificacion.count', -1) do
      delete notificacion_url(@notificacion)
    end

    assert_redirected_to notificaciones_url
  end
end
