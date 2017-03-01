require 'test_helper'

class TipoDifusionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_difusion = tipo_difusiones(:one)
  end

  test "should get index" do
    get tipo_difusiones_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_difusion_url
    assert_response :success
  end

  test "should create tipo_difusion" do
    assert_difference('TipoDifusion.count') do
      post tipo_difusiones_url, params: { tipo_difusion: { descripcion: @tipo_difusion.descripcion, estatus: @tipo_difusion.estatus } }
    end

    assert_redirected_to tipo_difusion_url(TipoDifusion.last)
  end

  test "should show tipo_difusion" do
    get tipo_difusion_url(@tipo_difusion)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_difusion_url(@tipo_difusion)
    assert_response :success
  end

  test "should update tipo_difusion" do
    patch tipo_difusion_url(@tipo_difusion), params: { tipo_difusion: { descripcion: @tipo_difusion.descripcion, estatus: @tipo_difusion.estatus } }
    assert_redirected_to tipo_difusion_url(@tipo_difusion)
  end

  test "should destroy tipo_difusion" do
    assert_difference('TipoDifusion.count', -1) do
      delete tipo_difusion_url(@tipo_difusion)
    end

    assert_redirected_to tipo_difusiones_url
  end
end
