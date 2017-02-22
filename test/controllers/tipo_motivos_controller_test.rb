require 'test_helper'

class TipoMotivosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_motivo = tipo_motivos(:one)
  end

  test "should get index" do
    get tipo_motivos_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_motivo_url
    assert_response :success
  end

  test "should create tipo_motivo" do
    assert_difference('TipoMotivo.count') do
      post tipo_motivos_url, params: { tipo_motivo: { descripcion: @tipo_motivo.descripcion, estatus: @tipo_motivo.estatus } }
    end

    assert_redirected_to tipo_motivo_url(TipoMotivo.last)
  end

  test "should show tipo_motivo" do
    get tipo_motivo_url(@tipo_motivo)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_motivo_url(@tipo_motivo)
    assert_response :success
  end

  test "should update tipo_motivo" do
    patch tipo_motivo_url(@tipo_motivo), params: { tipo_motivo: { descripcion: @tipo_motivo.descripcion, estatus: @tipo_motivo.estatus } }
    assert_redirected_to tipo_motivo_url(@tipo_motivo)
  end

  test "should destroy tipo_motivo" do
    assert_difference('TipoMotivo.count', -1) do
      delete tipo_motivo_url(@tipo_motivo)
    end

    assert_redirected_to tipo_motivos_url
  end
end
