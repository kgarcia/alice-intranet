require 'test_helper'

class RangoPesosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rango_peso = rango_pesos(:one)
  end

  test "should get index" do
    get rango_pesos_url
    assert_response :success
  end

  test "should get new" do
    get new_rango_peso_url
    assert_response :success
  end

  test "should create rango_peso" do
    assert_difference('RangoPeso.count') do
      post rango_pesos_url, params: { rango_peso: { descripcion: @rango_peso.descripcion, estatus: @rango_peso.estatus, peso_final: @rango_peso.peso_final, peso_inicial: @rango_peso.peso_inicial } }
    end

    assert_redirected_to rango_peso_url(RangoPeso.last)
  end

  test "should show rango_peso" do
    get rango_peso_url(@rango_peso)
    assert_response :success
  end

  test "should get edit" do
    get edit_rango_peso_url(@rango_peso)
    assert_response :success
  end

  test "should update rango_peso" do
    patch rango_peso_url(@rango_peso), params: { rango_peso: { descripcion: @rango_peso.descripcion, estatus: @rango_peso.estatus, peso_final: @rango_peso.peso_final, peso_inicial: @rango_peso.peso_inicial } }
    assert_redirected_to rango_peso_url(@rango_peso)
  end

  test "should destroy rango_peso" do
    assert_difference('RangoPeso.count', -1) do
      delete rango_peso_url(@rango_peso)
    end

    assert_redirected_to rango_pesos_url
  end
end
