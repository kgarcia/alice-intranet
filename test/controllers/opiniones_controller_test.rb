require 'test_helper'

class OpinionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @opinion = opiniones(:one)
  end

  test "should get index" do
    get opiniones_url
    assert_response :success
  end

  test "should get new" do
    get new_opinion_url
    assert_response :success
  end

  test "should create opinion" do
    assert_difference('Opinion.count') do
      post opiniones_url, params: { opinion: { correo: @opinion.correo, descripcion: @opinion.descripcion, estatus: @opinion.estatus, motivo_id: @opinion.motivo_id, nombre: @opinion.nombre, tipo_opinion_id: @opinion.tipo_opinion_id } }
    end

    assert_redirected_to opinion_url(Opinion.last)
  end

  test "should show opinion" do
    get opinion_url(@opinion)
    assert_response :success
  end

  test "should get edit" do
    get edit_opinion_url(@opinion)
    assert_response :success
  end

  test "should update opinion" do
    patch opinion_url(@opinion), params: { opinion: { correo: @opinion.correo, descripcion: @opinion.descripcion, estatus: @opinion.estatus, motivo_id: @opinion.motivo_id, nombre: @opinion.nombre, tipo_opinion_id: @opinion.tipo_opinion_id } }
    assert_redirected_to opinion_url(@opinion)
  end

  test "should destroy opinion" do
    assert_difference('Opinion.count', -1) do
      delete opinion_url(@opinion)
    end

    assert_redirected_to opiniones_url
  end
end
