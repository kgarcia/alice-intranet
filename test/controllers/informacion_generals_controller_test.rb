require 'test_helper'

class InformacionGeneralsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @informacion_general = informacion_generals(:one)
  end

  test "should get index" do
    get informacion_generals_url
    assert_response :success
  end

  test "should get new" do
    get new_informacion_general_url
    assert_response :success
  end

  test "should create informacion_general" do
    assert_difference('InformacionGeneral.count') do
      post informacion_generals_url, params: { informacion_general: { direccion: @informacion_general.direccion, email: @informacion_general.email, latitud: @informacion_general.latitud, logo: @informacion_general.logo, longitud: @informacion_general.longitud, nombre: @informacion_general.nombre, rif: @informacion_general.rif, slogan: @informacion_general.slogan, tlf: @informacion_general.tlf, widgetFB: @informacion_general.widgetFB, widgetTW: @informacion_general.widgetTW } }
    end

    assert_redirected_to informacion_general_url(InformacionGeneral.last)
  end

  test "should show informacion_general" do
    get informacion_general_url(@informacion_general)
    assert_response :success
  end

  test "should get edit" do
    get edit_informacion_general_url(@informacion_general)
    assert_response :success
  end

  test "should update informacion_general" do
    patch informacion_general_url(@informacion_general), params: { informacion_general: { direccion: @informacion_general.direccion, email: @informacion_general.email, latitud: @informacion_general.latitud, logo: @informacion_general.logo, longitud: @informacion_general.longitud, nombre: @informacion_general.nombre, rif: @informacion_general.rif, slogan: @informacion_general.slogan, tlf: @informacion_general.tlf, widgetFB: @informacion_general.widgetFB, widgetTW: @informacion_general.widgetTW } }
    assert_redirected_to informacion_general_url(@informacion_general)
  end

  test "should destroy informacion_general" do
    assert_difference('InformacionGeneral.count', -1) do
      delete informacion_general_url(@informacion_general)
    end

    assert_redirected_to informacion_generals_url
  end
end
