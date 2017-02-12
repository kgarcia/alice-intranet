require 'test_helper'

class GrupoSanguineosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grupo_sanguineo = grupo_sanguineos(:one)
  end

  test "should get index" do
    get grupo_sanguineos_url
    assert_response :success
  end

  test "should get new" do
    get new_grupo_sanguineo_url
    assert_response :success
  end

  test "should create grupo_sanguineo" do
    assert_difference('GrupoSanguineo.count') do
      post grupo_sanguineos_url, params: { grupo_sanguineo: { descripcion: @grupo_sanguineo.descripcion, estatus: @grupo_sanguineo.estatus } }
    end

    assert_redirected_to grupo_sanguineo_url(GrupoSanguineo.last)
  end

  test "should show grupo_sanguineo" do
    get grupo_sanguineo_url(@grupo_sanguineo)
    assert_response :success
  end

  test "should get edit" do
    get edit_grupo_sanguineo_url(@grupo_sanguineo)
    assert_response :success
  end

  test "should update grupo_sanguineo" do
    patch grupo_sanguineo_url(@grupo_sanguineo), params: { grupo_sanguineo: { descripcion: @grupo_sanguineo.descripcion, estatus: @grupo_sanguineo.estatus } }
    assert_redirected_to grupo_sanguineo_url(@grupo_sanguineo)
  end

  test "should destroy grupo_sanguineo" do
    assert_difference('GrupoSanguineo.count', -1) do
      delete grupo_sanguineo_url(@grupo_sanguineo)
    end

    assert_redirected_to grupo_sanguineos_url
  end
end
