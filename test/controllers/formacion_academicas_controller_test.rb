require 'test_helper'

class FormacionAcademicasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @formacion_academica = formacion_academicas(:one)
  end

  test "should get index" do
    get formacion_academicas_url
    assert_response :success
  end

  test "should get new" do
    get new_formacion_academica_url
    assert_response :success
  end

  test "should create formacion_academica" do
    assert_difference('FormacionAcademica.count') do
      post formacion_academicas_url, params: { formacion_academica: { descripcion: @formacion_academica.descripcion, estatus: @formacion_academica.estatus, nivel_formacion_id: @formacion_academica.nivel_formacion_id } }
    end

    assert_redirected_to formacion_academica_url(FormacionAcademica.last)
  end

  test "should show formacion_academica" do
    get formacion_academica_url(@formacion_academica)
    assert_response :success
  end

  test "should get edit" do
    get edit_formacion_academica_url(@formacion_academica)
    assert_response :success
  end

  test "should update formacion_academica" do
    patch formacion_academica_url(@formacion_academica), params: { formacion_academica: { descripcion: @formacion_academica.descripcion, estatus: @formacion_academica.estatus, nivel_formacion_id: @formacion_academica.nivel_formacion_id } }
    assert_redirected_to formacion_academica_url(@formacion_academica)
  end

  test "should destroy formacion_academica" do
    assert_difference('FormacionAcademica.count', -1) do
      delete formacion_academica_url(@formacion_academica)
    end

    assert_redirected_to formacion_academicas_url
  end
end
