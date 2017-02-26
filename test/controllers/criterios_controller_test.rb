require 'test_helper'

class CriteriosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @criterio = criterios(:one)
  end

  test "should get index" do
    get criterios_url
    assert_response :success
  end

  test "should get new" do
    get new_criterio_url
    assert_response :success
  end

  test "should create criterio" do
    assert_difference('Criterio.count') do
      post criterios_url, params: { criterio: { descripcion: @criterio.descripcion, estatus: @criterio.estatus, tipo_criterio_id: @criterio.tipo_criterio_id } }
    end

    assert_redirected_to criterio_url(Criterio.last)
  end

  test "should show criterio" do
    get criterio_url(@criterio)
    assert_response :success
  end

  test "should get edit" do
    get edit_criterio_url(@criterio)
    assert_response :success
  end

  test "should update criterio" do
    patch criterio_url(@criterio), params: { criterio: { descripcion: @criterio.descripcion, estatus: @criterio.estatus, tipo_criterio_id: @criterio.tipo_criterio_id } }
    assert_redirected_to criterio_url(@criterio)
  end

  test "should destroy criterio" do
    assert_difference('Criterio.count', -1) do
      delete criterio_url(@criterio)
    end

    assert_redirected_to criterios_url
  end
end
