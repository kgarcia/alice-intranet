require 'test_helper'

class CirugiasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cirugia = cirugias(:one)
  end

  test "should get index" do
    get cirugias_url
    assert_response :success
  end

  test "should get new" do
    get new_cirugia_url
    assert_response :success
  end

  test "should create cirugia" do
    assert_difference('Cirugia.count') do
      post cirugias_url, params: { cirugia: { TipoCirugia_id: @cirugia.TipoCirugia_id, descripcion: @cirugia.descripcion, estatus: @cirugia.estatus } }
    end

    assert_redirected_to cirugia_url(Cirugia.last)
  end

  test "should show cirugia" do
    get cirugia_url(@cirugia)
    assert_response :success
  end

  test "should get edit" do
    get edit_cirugia_url(@cirugia)
    assert_response :success
  end

  test "should update cirugia" do
    patch cirugia_url(@cirugia), params: { cirugia: { TipoCirugia_id: @cirugia.TipoCirugia_id, descripcion: @cirugia.descripcion, estatus: @cirugia.estatus } }
    assert_redirected_to cirugia_url(@cirugia)
  end

  test "should destroy cirugia" do
    assert_difference('Cirugia.count', -1) do
      delete cirugia_url(@cirugia)
    end

    assert_redirected_to cirugias_url
  end
end
