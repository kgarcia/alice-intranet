require 'test_helper'

class OcupacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ocupacion = ocupaciones(:one)
  end

  test "should get index" do
    get ocupaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_ocupacion_url
    assert_response :success
  end

  test "should create ocupacion" do
    assert_difference('Ocupacion.count') do
      post ocupaciones_url, params: { ocupacion: { descripcion: @ocupacion.descripcion, estatus: @ocupacion.estatus } }
    end

    assert_redirected_to ocupacion_url(Ocupacion.last)
  end

  test "should show ocupacion" do
    get ocupacion_url(@ocupacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_ocupacion_url(@ocupacion)
    assert_response :success
  end

  test "should update ocupacion" do
    patch ocupacion_url(@ocupacion), params: { ocupacion: { descripcion: @ocupacion.descripcion, estatus: @ocupacion.estatus } }
    assert_redirected_to ocupacion_url(@ocupacion)
  end

  test "should destroy ocupacion" do
    assert_difference('Ocupacion.count', -1) do
      delete ocupacion_url(@ocupacion)
    end

    assert_redirected_to ocupaciones_url
  end
end
