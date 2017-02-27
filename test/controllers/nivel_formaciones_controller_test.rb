require 'test_helper'

class NivelFormacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nivel_formacion = nivel_formaciones(:one)
  end

  test "should get index" do
    get nivel_formaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_nivel_formacion_url
    assert_response :success
  end

  test "should create nivel_formacion" do
    assert_difference('NivelFormacion.count') do
      post nivel_formaciones_url, params: { nivel_formacion: { descripcion: @nivel_formacion.descripcion, estatus: @nivel_formacion.estatus } }
    end

    assert_redirected_to nivel_formacion_url(NivelFormacion.last)
  end

  test "should show nivel_formacion" do
    get nivel_formacion_url(@nivel_formacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_nivel_formacion_url(@nivel_formacion)
    assert_response :success
  end

  test "should update nivel_formacion" do
    patch nivel_formacion_url(@nivel_formacion), params: { nivel_formacion: { descripcion: @nivel_formacion.descripcion, estatus: @nivel_formacion.estatus } }
    assert_redirected_to nivel_formacion_url(@nivel_formacion)
  end

  test "should destroy nivel_formacion" do
    assert_difference('NivelFormacion.count', -1) do
      delete nivel_formacion_url(@nivel_formacion)
    end

    assert_redirected_to nivel_formaciones_url
  end
end
