require 'test_helper'

class TipoBusquedasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_busqueda = tipo_busquedas(:one)
  end

  test "should get index" do
    get tipo_busquedas_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_busqueda_url
    assert_response :success
  end

  test "should create tipo_busqueda" do
    assert_difference('TipoBusqueda.count') do
      post tipo_busquedas_url, params: { tipo_busqueda: { descripcion: @tipo_busqueda.descripcion, estatus: @tipo_busqueda.estatus } }
    end

    assert_redirected_to tipo_busqueda_url(TipoBusqueda.last)
  end

  test "should show tipo_busqueda" do
    get tipo_busqueda_url(@tipo_busqueda)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_busqueda_url(@tipo_busqueda)
    assert_response :success
  end

  test "should update tipo_busqueda" do
    patch tipo_busqueda_url(@tipo_busqueda), params: { tipo_busqueda: { descripcion: @tipo_busqueda.descripcion, estatus: @tipo_busqueda.estatus } }
    assert_redirected_to tipo_busqueda_url(@tipo_busqueda)
  end

  test "should destroy tipo_busqueda" do
    assert_difference('TipoBusqueda.count', -1) do
      delete tipo_busqueda_url(@tipo_busqueda)
    end

    assert_redirected_to tipo_busquedas_url
  end
end
