require 'test_helper'

class DiasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dia = dias(:one)
  end

  test "should get index" do
    get dias_url
    assert_response :success
  end

  test "should get new" do
    get new_dia_url
    assert_response :success
  end

  test "should create dia" do
    assert_difference('Dia.count') do
      post dias_url, params: { dia: { descripcion: @dia.descripcion, estatus: @dia.estatus } }
    end

    assert_redirected_to dia_url(Dia.last)
  end

  test "should show dia" do
    get dia_url(@dia)
    assert_response :success
  end

  test "should get edit" do
    get edit_dia_url(@dia)
    assert_response :success
  end

  test "should update dia" do
    patch dia_url(@dia), params: { dia: { descripcion: @dia.descripcion, estatus: @dia.estatus } }
    assert_redirected_to dia_url(@dia)
  end

  test "should destroy dia" do
    assert_difference('Dia.count', -1) do
      delete dia_url(@dia)
    end

    assert_redirected_to dias_url
  end
end
