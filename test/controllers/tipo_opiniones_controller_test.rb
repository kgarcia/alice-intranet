require 'test_helper'

class TipoOpinionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_opinion = tipo_opiniones(:one)
  end

  test "should get index" do
    get tipo_opiniones_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_opinion_url
    assert_response :success
  end

  test "should create tipo_opinion" do
    assert_difference('TipoOpinion.count') do
      post tipo_opiniones_url, params: { tipo_opinion: { descripcion: @tipo_opinion.descripcion, estatus: @tipo_opinion.estatus } }
    end

    assert_redirected_to tipo_opinion_url(TipoOpinion.last)
  end

  test "should show tipo_opinion" do
    get tipo_opinion_url(@tipo_opinion)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_opinion_url(@tipo_opinion)
    assert_response :success
  end

  test "should update tipo_opinion" do
    patch tipo_opinion_url(@tipo_opinion), params: { tipo_opinion: { descripcion: @tipo_opinion.descripcion, estatus: @tipo_opinion.estatus } }
    assert_redirected_to tipo_opinion_url(@tipo_opinion)
  end

  test "should destroy tipo_opinion" do
    assert_difference('TipoOpinion.count', -1) do
      delete tipo_opinion_url(@tipo_opinion)
    end

    assert_redirected_to tipo_opiniones_url
  end
end
