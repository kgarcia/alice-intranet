require 'test_helper'

class MedioDifusionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medio_difusion = medio_difusiones(:one)
  end

  test "should get index" do
    get medio_difusiones_url
    assert_response :success
  end

  test "should get new" do
    get new_medio_difusion_url
    assert_response :success
  end

  test "should create medio_difusion" do
    assert_difference('MedioDifusion.count') do
      post medio_difusiones_url, params: { medio_difusion: { descripcion: @medio_difusion.descripcion, estatus: @medio_difusion.estatus } }
    end

    assert_redirected_to medio_difusion_url(MedioDifusion.last)
  end

  test "should show medio_difusion" do
    get medio_difusion_url(@medio_difusion)
    assert_response :success
  end

  test "should get edit" do
    get edit_medio_difusion_url(@medio_difusion)
    assert_response :success
  end

  test "should update medio_difusion" do
    patch medio_difusion_url(@medio_difusion), params: { medio_difusion: { descripcion: @medio_difusion.descripcion, estatus: @medio_difusion.estatus } }
    assert_redirected_to medio_difusion_url(@medio_difusion)
  end

  test "should destroy medio_difusion" do
    assert_difference('MedioDifusion.count', -1) do
      delete medio_difusion_url(@medio_difusion)
    end

    assert_redirected_to medio_difusiones_url
  end
end
