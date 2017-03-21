require 'test_helper'

class DiscapacidadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @discapacidad = discapacidades(:one)
  end

  test "should get index" do
    get discapacidades_url
    assert_response :success
  end

  test "should get new" do
    get new_discapacidad_url
    assert_response :success
  end

  test "should create discapacidad" do
    assert_difference('Discapacidad.count') do
      post discapacidades_url, params: { discapacidad: { TipoDiscapacidad_id: @discapacidad.TipoDiscapacidad_id, descripcion: @discapacidad.descripcion, estatus: @discapacidad.estatus } }
    end

    assert_redirected_to discapacidad_url(Discapacidad.last)
  end

  test "should show discapacidad" do
    get discapacidad_url(@discapacidad)
    assert_response :success
  end

  test "should get edit" do
    get edit_discapacidad_url(@discapacidad)
    assert_response :success
  end

  test "should update discapacidad" do
    patch discapacidad_url(@discapacidad), params: { discapacidad: { TipoDiscapacidad_id: @discapacidad.TipoDiscapacidad_id, descripcion: @discapacidad.descripcion, estatus: @discapacidad.estatus } }
    assert_redirected_to discapacidad_url(@discapacidad)
  end

  test "should destroy discapacidad" do
    assert_difference('Discapacidad.count', -1) do
      delete discapacidad_url(@discapacidad)
    end

    assert_redirected_to discapacidades_url
  end
end
