require 'test_helper'

class RangoEdadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rango_edad = rango_edades(:one)
  end

  test "should get index" do
    get rango_edades_url
    assert_response :success
  end

  test "should get new" do
    get new_rango_edad_url
    assert_response :success
  end

  test "should create rango_edad" do
    assert_difference('RangoEdad.count') do
      post rango_edades_url, params: { rango_edad: { descripcion: @rango_edad.descripcion, edad_final: @rango_edad.edad_final, edad_inicial: @rango_edad.edad_inicial, estatus: @rango_edad.estatus } }
    end

    assert_redirected_to rango_edad_url(RangoEdad.last)
  end

  test "should show rango_edad" do
    get rango_edad_url(@rango_edad)
    assert_response :success
  end

  test "should get edit" do
    get edit_rango_edad_url(@rango_edad)
    assert_response :success
  end

  test "should update rango_edad" do
    patch rango_edad_url(@rango_edad), params: { rango_edad: { descripcion: @rango_edad.descripcion, edad_final: @rango_edad.edad_final, edad_inicial: @rango_edad.edad_inicial, estatus: @rango_edad.estatus } }
    assert_redirected_to rango_edad_url(@rango_edad)
  end

  test "should destroy rango_edad" do
    assert_difference('RangoEdad.count', -1) do
      delete rango_edad_url(@rango_edad)
    end

    assert_redirected_to rango_edades_url
  end
end
