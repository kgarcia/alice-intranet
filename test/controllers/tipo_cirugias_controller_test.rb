require 'test_helper'

class TipoCirugiasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_cirugia = tipo_cirugias(:one)
  end

  test "should get index" do
    get tipo_cirugias_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_cirugia_url
    assert_response :success
  end

  test "should create tipo_cirugia" do
    assert_difference('TipoCirugia.count') do
      post tipo_cirugias_url, params: { tipo_cirugia: { descripcion: @tipo_cirugia.descripcion, estatus: @tipo_cirugia.estatus } }
    end

    assert_redirected_to tipo_cirugia_url(TipoCirugia.last)
  end

  test "should show tipo_cirugia" do
    get tipo_cirugia_url(@tipo_cirugia)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_cirugia_url(@tipo_cirugia)
    assert_response :success
  end

  test "should update tipo_cirugia" do
    patch tipo_cirugia_url(@tipo_cirugia), params: { tipo_cirugia: { descripcion: @tipo_cirugia.descripcion, estatus: @tipo_cirugia.estatus } }
    assert_redirected_to tipo_cirugia_url(@tipo_cirugia)
  end

  test "should destroy tipo_cirugia" do
    assert_difference('TipoCirugia.count', -1) do
      delete tipo_cirugia_url(@tipo_cirugia)
    end

    assert_redirected_to tipo_cirugias_url
  end
end
