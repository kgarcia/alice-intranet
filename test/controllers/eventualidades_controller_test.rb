require 'test_helper'

class EventualidadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @eventualidad = eventualidades(:one)
  end

  test "should get index" do
    get eventualidades_url
    assert_response :success
  end

  test "should get new" do
    get new_eventualidad_url
    assert_response :success
  end

  test "should create eventualidad" do
    assert_difference('Eventualidad.count') do
      post eventualidades_url, params: { eventualidad: { descripcion: @eventualidad.descripcion, estatus: @eventualidad.estatus, fecha_fin: @eventualidad.fecha_fin, fecha_inicio: @eventualidad.fecha_inicio, motivo_id: @eventualidad.motivo_id, tipo_eventualidad_id: @eventualidad.tipo_eventualidad_id } }
    end

    assert_redirected_to eventualidad_url(Eventualidad.last)
  end

  test "should show eventualidad" do
    get eventualidad_url(@eventualidad)
    assert_response :success
  end

  test "should get edit" do
    get edit_eventualidad_url(@eventualidad)
    assert_response :success
  end

  test "should update eventualidad" do
    patch eventualidad_url(@eventualidad), params: { eventualidad: { descripcion: @eventualidad.descripcion, estatus: @eventualidad.estatus, fecha_fin: @eventualidad.fecha_fin, fecha_inicio: @eventualidad.fecha_inicio, motivo_id: @eventualidad.motivo_id, tipo_eventualidad_id: @eventualidad.tipo_eventualidad_id } }
    assert_redirected_to eventualidad_url(@eventualidad)
  end

  test "should destroy eventualidad" do
    assert_difference('Eventualidad.count', -1) do
      delete eventualidad_url(@eventualidad)
    end

    assert_redirected_to eventualidades_url
  end
end
