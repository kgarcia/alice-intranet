require 'test_helper'

class CriterioTipoServiciosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @criterio_tipo_servicio = criterio_tipo_servicios(:one)
  end

  test "should get index" do
    get criterio_tipo_servicios_url
    assert_response :success
  end

  test "should get new" do
    get new_criterio_tipo_servicio_url
    assert_response :success
  end

  test "should create criterio_tipo_servicio" do
    assert_difference('CriterioTipoServicio.count') do
      post criterio_tipo_servicios_url, params: { criterio_tipo_servicio: { criterio_id: @criterio_tipo_servicio.criterio_id, tipo_servici_id: @criterio_tipo_servicio.tipo_servici_id } }
    end

    assert_redirected_to criterio_tipo_servicio_url(CriterioTipoServicio.last)
  end

  test "should show criterio_tipo_servicio" do
    get criterio_tipo_servicio_url(@criterio_tipo_servicio)
    assert_response :success
  end

  test "should get edit" do
    get edit_criterio_tipo_servicio_url(@criterio_tipo_servicio)
    assert_response :success
  end

  test "should update criterio_tipo_servicio" do
    patch criterio_tipo_servicio_url(@criterio_tipo_servicio), params: { criterio_tipo_servicio: { criterio_id: @criterio_tipo_servicio.criterio_id, tipo_servici_id: @criterio_tipo_servicio.tipo_servici_id } }
    assert_redirected_to criterio_tipo_servicio_url(@criterio_tipo_servicio)
  end

  test "should destroy criterio_tipo_servicio" do
    assert_difference('CriterioTipoServicio.count', -1) do
      delete criterio_tipo_servicio_url(@criterio_tipo_servicio)
    end

    assert_redirected_to criterio_tipo_servicios_url
  end
end
