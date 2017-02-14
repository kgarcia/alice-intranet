require 'test_helper'

class EstadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estado = estados(:one)
  end

  test "should get index" do
    get estados_url
    assert_response :success
  end

  test "should get new" do
    get new_estado_url
    assert_response :success
  end

  test "should create estado" do
    assert_difference('Estado.count') do
      post estados_url, params: { estado: { descripcion: @estado.descripcion, estatus: @estado.estatus, pais_id: @estado.pais_id } }
    end

    assert_redirected_to estado_url(Estado.last)
  end

  test "should show estado" do
    get estado_url(@estado)
    assert_response :success
  end

  test "should get edit" do
    get edit_estado_url(@estado)
    assert_response :success
  end

  test "should update estado" do
    patch estado_url(@estado), params: { estado: { descripcion: @estado.descripcion, estatus: @estado.estatus, pais_id: @estado.pais_id } }
    assert_redirected_to estado_url(@estado)
  end

  test "should destroy estado" do
    assert_difference('Estado.count', -1) do
      delete estado_url(@estado)
    end

    assert_redirected_to estados_url
  end
end
