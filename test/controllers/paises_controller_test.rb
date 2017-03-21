require 'test_helper'

class PaisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pais = paises(:one)
  end

  test "should get index" do
    get paises_url
    assert_response :success
  end

  test "should get new" do
    get new_pais_url
    assert_response :success
  end

  test "should create pais" do
    assert_difference('Pais.count') do
      post paises_url, params: { pais: { descripcion: @pais.descripcion, estatus: @pais.estatus } }
    end

    assert_redirected_to pais_url(Pais.last)
  end

  test "should show pais" do
    get pais_url(@pais)
    assert_response :success
  end

  test "should get edit" do
    get edit_pais_url(@pais)
    assert_response :success
  end

  test "should update pais" do
    patch pais_url(@pais), params: { pais: { descripcion: @pais.descripcion, estatus: @pais.estatus } }
    assert_redirected_to pais_url(@pais)
  end

  test "should destroy pais" do
    assert_difference('Pais.count', -1) do
      delete pais_url(@pais)
    end

    assert_redirected_to paises_url
  end
end
