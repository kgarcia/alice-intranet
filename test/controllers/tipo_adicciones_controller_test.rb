require 'test_helper'

class TipoAdiccionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_adiccion = tipo_adicciones(:one)
  end

  test "should get index" do
    get tipo_adicciones_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_adiccion_url
    assert_response :success
  end

  test "should create tipo_adiccion" do
    assert_difference('TipoAdiccion.count') do
      post tipo_adicciones_url, params: { tipo_adiccion: { descripcion: @tipo_adiccion.descripcion, estatus: @tipo_adiccion.estatus } }
    end

    assert_redirected_to tipo_adiccion_url(TipoAdiccion.last)
  end

  test "should show tipo_adiccion" do
    get tipo_adiccion_url(@tipo_adiccion)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_adiccion_url(@tipo_adiccion)
    assert_response :success
  end

  test "should update tipo_adiccion" do
    patch tipo_adiccion_url(@tipo_adiccion), params: { tipo_adiccion: { descripcion: @tipo_adiccion.descripcion, estatus: @tipo_adiccion.estatus } }
    assert_redirected_to tipo_adiccion_url(@tipo_adiccion)
  end

  test "should destroy tipo_adiccion" do
    assert_difference('TipoAdiccion.count', -1) do
      delete tipo_adiccion_url(@tipo_adiccion)
    end

    assert_redirected_to tipo_adicciones_url
  end
end
