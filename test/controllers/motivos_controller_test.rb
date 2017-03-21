require 'test_helper'

class MotivosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @motivo = motivos(:one)
  end

  test "should get index" do
    get motivos_url
    assert_response :success
  end

  test "should get new" do
    get new_motivo_url
    assert_response :success
  end

  test "should create motivo" do
    assert_difference('Motivo.count') do
      post motivos_url, params: { motivo: { descripcion: @motivo.descripcion, estatus: @motivo.estatus, tipo_motivo_id: @motivo.tipo_motivo_id } }
    end

    assert_redirected_to motivo_url(Motivo.last)
  end

  test "should show motivo" do
    get motivo_url(@motivo)
    assert_response :success
  end

  test "should get edit" do
    get edit_motivo_url(@motivo)
    assert_response :success
  end

  test "should update motivo" do
    patch motivo_url(@motivo), params: { motivo: { descripcion: @motivo.descripcion, estatus: @motivo.estatus, tipo_motivo_id: @motivo.tipo_motivo_id } }
    assert_redirected_to motivo_url(@motivo)
  end

  test "should destroy motivo" do
    assert_difference('Motivo.count', -1) do
      delete motivo_url(@motivo)
    end

    assert_redirected_to motivos_url
  end
end
