require 'test_helper'

class TipoEventosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_evento = tipo_eventos(:one)
  end

  test "should get index" do
    get tipo_eventos_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_evento_url
    assert_response :success
  end

  test "should create tipo_evento" do
    assert_difference('TipoEvento.count') do
      post tipo_eventos_url, params: { tipo_evento: { descripcion: @tipo_evento.descripcion, estatus: @tipo_evento.estatus } }
    end

    assert_redirected_to tipo_evento_url(TipoEvento.last)
  end

  test "should show tipo_evento" do
    get tipo_evento_url(@tipo_evento)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_evento_url(@tipo_evento)
    assert_response :success
  end

  test "should update tipo_evento" do
    patch tipo_evento_url(@tipo_evento), params: { tipo_evento: { descripcion: @tipo_evento.descripcion, estatus: @tipo_evento.estatus } }
    assert_redirected_to tipo_evento_url(@tipo_evento)
  end

  test "should destroy tipo_evento" do
    assert_difference('TipoEvento.count', -1) do
      delete tipo_evento_url(@tipo_evento)
    end

    assert_redirected_to tipo_eventos_url
  end
end
