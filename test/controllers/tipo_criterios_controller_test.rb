require 'test_helper'

class TipoCriteriosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_criterio = tipo_criterios(:one)
  end

  test "should get index" do
    get tipo_criterios_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_criterio_url
    assert_response :success
  end

  test "should create tipo_criterio" do
    assert_difference('TipoCriterio.count') do
      post tipo_criterios_url, params: { tipo_criterio: { descripcion: @tipo_criterio.descripcion, estatus: @tipo_criterio.estatus } }
    end

    assert_redirected_to tipo_criterio_url(TipoCriterio.last)
  end

  test "should show tipo_criterio" do
    get tipo_criterio_url(@tipo_criterio)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_criterio_url(@tipo_criterio)
    assert_response :success
  end

  test "should update tipo_criterio" do
    patch tipo_criterio_url(@tipo_criterio), params: { tipo_criterio: { descripcion: @tipo_criterio.descripcion, estatus: @tipo_criterio.estatus } }
    assert_redirected_to tipo_criterio_url(@tipo_criterio)
  end

  test "should destroy tipo_criterio" do
    assert_difference('TipoCriterio.count', -1) do
      delete tipo_criterio_url(@tipo_criterio)
    end

    assert_redirected_to tipo_criterios_url
  end
end
