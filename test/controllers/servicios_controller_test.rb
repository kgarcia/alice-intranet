require 'test_helper'

class ServiciosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @servicio = servicios(:one)
  end

  test "should get index" do
    get servicios_url
    assert_response :success
  end

  test "should get new" do
    get new_servicio_url
    assert_response :success
  end

  test "should create servicio" do
    assert_difference('Servicio.count') do
      post servicios_url, params: { servicio: { descripcion: @servicio.descripcion, especialista_id: @servicio.especialista_id, estatus: @servicio.estatus, foto: @servicio.foto, precio: @servicio.precio, tipo_servicio_id: @servicio.tipo_servicio_id, ubicacion_id: @servicio.ubicacion_id } }
    end

    assert_redirected_to servicio_url(Servicio.last)
  end

  test "should show servicio" do
    get servicio_url(@servicio)
    assert_response :success
  end

  test "should get edit" do
    get edit_servicio_url(@servicio)
    assert_response :success
  end

  test "should update servicio" do
    patch servicio_url(@servicio), params: { servicio: { descripcion: @servicio.descripcion, especialista_id: @servicio.especialista_id, estatus: @servicio.estatus, foto: @servicio.foto, precio: @servicio.precio, tipo_servicio_id: @servicio.tipo_servicio_id, ubicacion_id: @servicio.ubicacion_id } }
    assert_redirected_to servicio_url(@servicio)
  end

  test "should destroy servicio" do
    assert_difference('Servicio.count', -1) do
      delete servicio_url(@servicio)
    end

    assert_redirected_to servicios_url
  end
end
