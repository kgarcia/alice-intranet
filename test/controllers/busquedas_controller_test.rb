require 'test_helper'

class BusquedasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @busqueda = busquedas(:one)
  end

  test "should get index" do
    get busquedas_url
    assert_response :success
  end

  test "should get new" do
    get new_busqueda_url
    assert_response :success
  end

  test "should create busqueda" do
    assert_difference('Busqueda.count') do
      post busquedas_url, params: { busqueda: { descripcion: @busqueda.descripcion, especialidad_id: @busqueda.especialidad_id, especialista_id: @busqueda.especialista_id, estatus: @busqueda.estatus, tipo_busqueda_id: @busqueda.tipo_busqueda_id, tipo_servicio_id: @busqueda.tipo_servicio_id } }
    end

    assert_redirected_to busqueda_url(Busqueda.last)
  end

  test "should show busqueda" do
    get busqueda_url(@busqueda)
    assert_response :success
  end

  test "should get edit" do
    get edit_busqueda_url(@busqueda)
    assert_response :success
  end

  test "should update busqueda" do
    patch busqueda_url(@busqueda), params: { busqueda: { descripcion: @busqueda.descripcion, especialidad_id: @busqueda.especialidad_id, especialista_id: @busqueda.especialista_id, estatus: @busqueda.estatus, tipo_busqueda_id: @busqueda.tipo_busqueda_id, tipo_servicio_id: @busqueda.tipo_servicio_id } }
    assert_redirected_to busqueda_url(@busqueda)
  end

  test "should destroy busqueda" do
    assert_difference('Busqueda.count', -1) do
      delete busqueda_url(@busqueda)
    end

    assert_redirected_to busquedas_url
  end
end
