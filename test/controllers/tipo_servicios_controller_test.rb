require 'test_helper'

class TipoServiciosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_servicio = tipo_servicios(:one)
  end

  test "should get index" do
    get tipo_servicios_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_servicio_url
    assert_response :success
  end

  test "should create tipo_servicio" do
    assert_difference('TipoServicio.count') do
      post tipo_servicios_url, params: { tipo_servicio: { descripcion: @tipo_servicio.descripcion, estatus: @tipo_servicio.estatus, foto: @tipo_servicio.foto, texto: @tipo_servicio.texto } }
    end

    assert_redirected_to tipo_servicio_url(TipoServicio.last)
  end

  test "should show tipo_servicio" do
    get tipo_servicio_url(@tipo_servicio)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_servicio_url(@tipo_servicio)
    assert_response :success
  end

  test "should update tipo_servicio" do
    patch tipo_servicio_url(@tipo_servicio), params: { tipo_servicio: { descripcion: @tipo_servicio.descripcion, estatus: @tipo_servicio.estatus, foto: @tipo_servicio.foto, texto: @tipo_servicio.texto } }
    assert_redirected_to tipo_servicio_url(@tipo_servicio)
  end

  test "should destroy tipo_servicio" do
    assert_difference('TipoServicio.count', -1) do
      delete tipo_servicio_url(@tipo_servicio)
    end

    assert_redirected_to tipo_servicios_url
  end
end
