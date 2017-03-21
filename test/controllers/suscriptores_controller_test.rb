require 'test_helper'

class SuscriptoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @suscriptor = suscriptores(:one)
  end

  test "should get index" do
    get suscriptores_url
    assert_response :success
  end

  test "should get new" do
    get new_suscriptor_url
    assert_response :success
  end

  test "should create suscriptor" do
    assert_difference('Suscriptor.count') do
      post suscriptores_url, params: { suscriptor: { email: @suscriptor.email, estatus: @suscriptor.estatus, persona_id: @suscriptor.persona_id } }
    end

    assert_redirected_to suscriptor_url(Suscriptor.last)
  end

  test "should show suscriptor" do
    get suscriptor_url(@suscriptor)
    assert_response :success
  end

  test "should get edit" do
    get edit_suscriptor_url(@suscriptor)
    assert_response :success
  end

  test "should update suscriptor" do
    patch suscriptor_url(@suscriptor), params: { suscriptor: { email: @suscriptor.email, estatus: @suscriptor.estatus, persona_id: @suscriptor.persona_id } }
    assert_redirected_to suscriptor_url(@suscriptor)
  end

  test "should destroy suscriptor" do
    assert_difference('Suscriptor.count', -1) do
      delete suscriptor_url(@suscriptor)
    end

    assert_redirected_to suscriptores_url
  end
end
