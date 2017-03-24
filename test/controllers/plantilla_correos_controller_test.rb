require 'test_helper'

class PlantillaCorreosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plantilla_correo = plantilla_correos(:one)
  end

  test "should get index" do
    get plantilla_correos_url
    assert_response :success
  end

  test "should get new" do
    get new_plantilla_correo_url
    assert_response :success
  end

  test "should create plantilla_correo" do
    assert_difference('PlantillaCorreo.count') do
      post plantilla_correos_url, params: { plantilla_correo: { descripcion: @plantilla_correo.descripcion, estatus: @plantilla_correo.estatus, texto: @plantilla_correo.texto } }
    end

    assert_redirected_to plantilla_correo_url(PlantillaCorreo.last)
  end

  test "should show plantilla_correo" do
    get plantilla_correo_url(@plantilla_correo)
    assert_response :success
  end

  test "should get edit" do
    get edit_plantilla_correo_url(@plantilla_correo)
    assert_response :success
  end

  test "should update plantilla_correo" do
    patch plantilla_correo_url(@plantilla_correo), params: { plantilla_correo: { descripcion: @plantilla_correo.descripcion, estatus: @plantilla_correo.estatus, texto: @plantilla_correo.texto } }
    assert_redirected_to plantilla_correo_url(@plantilla_correo)
  end

  test "should destroy plantilla_correo" do
    assert_difference('PlantillaCorreo.count', -1) do
      delete plantilla_correo_url(@plantilla_correo)
    end

    assert_redirected_to plantilla_correos_url
  end
end
