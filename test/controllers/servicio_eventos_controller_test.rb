require 'test_helper'

class ServicioEventosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @servicio_evento = servicio_eventos(:one)
  end

  test "should get index" do
    get servicio_eventos_url
    assert_response :success
  end

  test "should get new" do
    get new_servicio_evento_url
    assert_response :success
  end

  test "should create servicio_evento" do
    assert_difference('ServicioEvento.count') do
      post servicio_eventos_url, params: { servicio_evento: { descripcion: @servicio_evento.descripcion, estatus: @servicio_evento.estatus, evento_id: @servicio_evento.evento_id, servicio_id: @servicio_evento.servicio_id } }
    end

    assert_redirected_to servicio_evento_url(ServicioEvento.last)
  end

  test "should show servicio_evento" do
    get servicio_evento_url(@servicio_evento)
    assert_response :success
  end

  test "should get edit" do
    get edit_servicio_evento_url(@servicio_evento)
    assert_response :success
  end

  test "should update servicio_evento" do
    patch servicio_evento_url(@servicio_evento), params: { servicio_evento: { descripcion: @servicio_evento.descripcion, estatus: @servicio_evento.estatus, evento_id: @servicio_evento.evento_id, servicio_id: @servicio_evento.servicio_id } }
    assert_redirected_to servicio_evento_url(@servicio_evento)
  end

  test "should destroy servicio_evento" do
    assert_difference('ServicioEvento.count', -1) do
      delete servicio_evento_url(@servicio_evento)
    end

    assert_redirected_to servicio_eventos_url
  end
end
