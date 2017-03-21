require 'test_helper'

class TipoEventualidadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_eventualidad = tipo_eventualidades(:one)
  end

  test "should get index" do
    get tipo_eventualidades_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_eventualidad_url
    assert_response :success
  end

  test "should create tipo_eventualidad" do
    assert_difference('TipoEventualidad.count') do
      post tipo_eventualidades_url, params: { tipo_eventualidad: { descripcion: @tipo_eventualidad.descripcion, estatus: @tipo_eventualidad.estatus } }
    end

    assert_redirected_to tipo_eventualidad_url(TipoEventualidad.last)
  end

  test "should show tipo_eventualidad" do
    get tipo_eventualidad_url(@tipo_eventualidad)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_eventualidad_url(@tipo_eventualidad)
    assert_response :success
  end

  test "should update tipo_eventualidad" do
    patch tipo_eventualidad_url(@tipo_eventualidad), params: { tipo_eventualidad: { descripcion: @tipo_eventualidad.descripcion, estatus: @tipo_eventualidad.estatus } }
    assert_redirected_to tipo_eventualidad_url(@tipo_eventualidad)
  end

  test "should destroy tipo_eventualidad" do
    assert_difference('TipoEventualidad.count', -1) do
      delete tipo_eventualidad_url(@tipo_eventualidad)
    end

    assert_redirected_to tipo_eventualidades_url
  end
end
