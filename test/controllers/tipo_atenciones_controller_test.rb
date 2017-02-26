require 'test_helper'

class TipoAtencionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_atencion = tipo_atenciones(:one)
  end

  test "should get index" do
    get tipo_atenciones_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_atencion_url
    assert_response :success
  end

  test "should create tipo_atencion" do
    assert_difference('TipoAtencion.count') do
      post tipo_atenciones_url, params: { tipo_atencion: { descripcion: @tipo_atencion.descripcion, estatus: @tipo_atencion.estatus } }
    end

    assert_redirected_to tipo_atencion_url(TipoAtencion.last)
  end

  test "should show tipo_atencion" do
    get tipo_atencion_url(@tipo_atencion)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_atencion_url(@tipo_atencion)
    assert_response :success
  end

  test "should update tipo_atencion" do
    patch tipo_atencion_url(@tipo_atencion), params: { tipo_atencion: { descripcion: @tipo_atencion.descripcion, estatus: @tipo_atencion.estatus } }
    assert_redirected_to tipo_atencion_url(@tipo_atencion)
  end

  test "should destroy tipo_atencion" do
    assert_difference('TipoAtencion.count', -1) do
      delete tipo_atencion_url(@tipo_atencion)
    end

    assert_redirected_to tipo_atenciones_url
  end
end
