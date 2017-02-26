require 'test_helper'

class UbicacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ubicacion = ubicaciones(:one)
  end

  test "should get index" do
    get ubicaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_ubicacion_url
    assert_response :success
  end

  test "should create ubicacion" do
    assert_difference('Ubicacion.count') do
      post ubicaciones_url, params: { ubicacion: { ciudad_id: @ubicacion.ciudad_id, descripcion: @ubicacion.descripcion, estatus: @ubicacion.estatus, sector_id: @ubicacion.sector_id, tipo_ubicacion_id: @ubicacion.tipo_ubicacion_id } }
    end

    assert_redirected_to ubicacion_url(Ubicacion.last)
  end

  test "should show ubicacion" do
    get ubicacion_url(@ubicacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_ubicacion_url(@ubicacion)
    assert_response :success
  end

  test "should update ubicacion" do
    patch ubicacion_url(@ubicacion), params: { ubicacion: { ciudad_id: @ubicacion.ciudad_id, descripcion: @ubicacion.descripcion, estatus: @ubicacion.estatus, sector_id: @ubicacion.sector_id, tipo_ubicacion_id: @ubicacion.tipo_ubicacion_id } }
    assert_redirected_to ubicacion_url(@ubicacion)
  end

  test "should destroy ubicacion" do
    assert_difference('Ubicacion.count', -1) do
      delete ubicacion_url(@ubicacion)
    end

    assert_redirected_to ubicaciones_url
  end
end
