require 'test_helper'

class VacunasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vacuna = vacunas(:one)
  end

  test "should get index" do
    get vacunas_url
    assert_response :success
  end

  test "should get new" do
    get new_vacuna_url
    assert_response :success
  end

  test "should create vacuna" do
    assert_difference('Vacuna.count') do
      post vacunas_url, params: { vacuna: { descripcion: @vacuna.descripcion, estatus: @vacuna.estatus } }
    end

    assert_redirected_to vacuna_url(Vacuna.last)
  end

  test "should show vacuna" do
    get vacuna_url(@vacuna)
    assert_response :success
  end

  test "should get edit" do
    get edit_vacuna_url(@vacuna)
    assert_response :success
  end

  test "should update vacuna" do
    patch vacuna_url(@vacuna), params: { vacuna: { descripcion: @vacuna.descripcion, estatus: @vacuna.estatus } }
    assert_redirected_to vacuna_url(@vacuna)
  end

  test "should destroy vacuna" do
    assert_difference('Vacuna.count', -1) do
      delete vacuna_url(@vacuna)
    end

    assert_redirected_to vacunas_url
  end
end
