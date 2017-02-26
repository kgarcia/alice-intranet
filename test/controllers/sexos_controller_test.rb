require 'test_helper'

class SexosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sexo = sexos(:one)
  end

  test "should get index" do
    get sexos_url
    assert_response :success
  end

  test "should get new" do
    get new_sexo_url
    assert_response :success
  end

  test "should create sexo" do
    assert_difference('Sexo.count') do
      post sexos_url, params: { sexo: { decripcion: @sexo.decripcion, estatus: @sexo.estatus } }
    end

    assert_redirected_to sexo_url(Sexo.last)
  end

  test "should show sexo" do
    get sexo_url(@sexo)
    assert_response :success
  end

  test "should get edit" do
    get edit_sexo_url(@sexo)
    assert_response :success
  end

  test "should update sexo" do
    patch sexo_url(@sexo), params: { sexo: { decripcion: @sexo.decripcion, estatus: @sexo.estatus } }
    assert_redirected_to sexo_url(@sexo)
  end

  test "should destroy sexo" do
    assert_difference('Sexo.count', -1) do
      delete sexo_url(@sexo)
    end

    assert_redirected_to sexos_url
  end
end
