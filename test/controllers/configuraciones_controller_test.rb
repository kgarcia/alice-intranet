require 'test_helper'

class ConfiguracionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @configuracion = configuraciones(:one)
  end

  test "should get index" do
    get configuraciones_url
    assert_response :success
  end

  test "should get new" do
    get new_configuracion_url
    assert_response :success
  end

  test "should create configuracion" do
    assert_difference('Configuracion.count') do
      post configuraciones_url, params: { configuracion: { envia_email: @configuracion.envia_email, envia_notificaciones: @configuracion.envia_notificaciones } }
    end

    assert_redirected_to configuracion_url(Configuracion.last)
  end

  test "should show configuracion" do
    get configuracion_url(@configuracion)
    assert_response :success
  end

  test "should get edit" do
    get edit_configuracion_url(@configuracion)
    assert_response :success
  end

  test "should update configuracion" do
    patch configuracion_url(@configuracion), params: { configuracion: { envia_email: @configuracion.envia_email, envia_notificaciones: @configuracion.envia_notificaciones } }
    assert_redirected_to configuracion_url(@configuracion)
  end

  test "should destroy configuracion" do
    assert_difference('Configuracion.count', -1) do
      delete configuracion_url(@configuracion)
    end

    assert_redirected_to configuraciones_url
  end
end
