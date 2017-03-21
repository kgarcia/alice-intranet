require 'test_helper'

class TipoEntidadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_entidad = tipo_entidads(:one)
  end

  test "should get index" do
    get tipo_entidads_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_entidad_url
    assert_response :success
  end

  test "should create tipo_entidad" do
    assert_difference('TipoEntidad.count') do
      post tipo_entidads_url, params: { tipo_entidad: { descripcion: @tipo_entidad.descripcion, estatus: @tipo_entidad.estatus } }
    end

    assert_redirected_to tipo_entidad_url(TipoEntidad.last)
  end

  test "should show tipo_entidad" do
    get tipo_entidad_url(@tipo_entidad)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_entidad_url(@tipo_entidad)
    assert_response :success
  end

  test "should update tipo_entidad" do
    patch tipo_entidad_url(@tipo_entidad), params: { tipo_entidad: { descripcion: @tipo_entidad.descripcion, estatus: @tipo_entidad.estatus } }
    assert_redirected_to tipo_entidad_url(@tipo_entidad)
  end

  test "should destroy tipo_entidad" do
    assert_difference('TipoEntidad.count', -1) do
      delete tipo_entidad_url(@tipo_entidad)
    end

    assert_redirected_to tipo_entidads_url
  end
end
