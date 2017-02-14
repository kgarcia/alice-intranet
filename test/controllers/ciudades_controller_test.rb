require 'test_helper'

class CiudadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ciudad = ciudades(:one)
  end

  test "should get index" do
    get ciudades_url
    assert_response :success
  end

  test "should get new" do
    get new_ciudad_url
    assert_response :success
  end

  test "should create ciudad" do
    assert_difference('Ciudad.count') do
      post ciudades_url, params: { ciudad: { descripcion: @ciudad.descripcion, estado_id: @ciudad.estado_id, estatus: @ciudad.estatus } }
    end

    assert_redirected_to ciudad_url(Ciudad.last)
  end

  test "should show ciudad" do
    get ciudad_url(@ciudad)
    assert_response :success
  end

  test "should get edit" do
    get edit_ciudad_url(@ciudad)
    assert_response :success
  end

  test "should update ciudad" do
    patch ciudad_url(@ciudad), params: { ciudad: { descripcion: @ciudad.descripcion, estado_id: @ciudad.estado_id, estatus: @ciudad.estatus } }
    assert_redirected_to ciudad_url(@ciudad)
  end

  test "should destroy ciudad" do
    assert_difference('Ciudad.count', -1) do
      delete ciudad_url(@ciudad)
    end

    assert_redirected_to ciudades_url
  end
end
