require 'test_helper'

class EstadoCivilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estado_civil = estado_civiles(:one)
  end

  test "should get index" do
    get estado_civiles_url
    assert_response :success
  end

  test "should get new" do
    get new_estado_civil_url
    assert_response :success
  end

  test "should create estado_civil" do
    assert_difference('EstadoCivil.count') do
      post estado_civiles_url, params: { estado_civil: { descripcion: @estado_civil.descripcion, estatus: @estado_civil.estatus } }
    end

    assert_redirected_to estado_civil_url(EstadoCivil.last)
  end

  test "should show estado_civil" do
    get estado_civil_url(@estado_civil)
    assert_response :success
  end

  test "should get edit" do
    get edit_estado_civil_url(@estado_civil)
    assert_response :success
  end

  test "should update estado_civil" do
    patch estado_civil_url(@estado_civil), params: { estado_civil: { descripcion: @estado_civil.descripcion, estatus: @estado_civil.estatus } }
    assert_redirected_to estado_civil_url(@estado_civil)
  end

  test "should destroy estado_civil" do
    assert_difference('EstadoCivil.count', -1) do
      delete estado_civil_url(@estado_civil)
    end

    assert_redirected_to estado_civiles_url
  end
end
