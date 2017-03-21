require 'test_helper'

class TipoPreguntasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_pregunta = tipo_preguntas(:one)
  end

  test "should get index" do
    get tipo_preguntas_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_pregunta_url
    assert_response :success
  end

  test "should create tipo_pregunta" do
    assert_difference('TipoPregunta.count') do
      post tipo_preguntas_url, params: { tipo_pregunta: { descripcion: @tipo_pregunta.descripcion, estatus: @tipo_pregunta.estatus } }
    end

    assert_redirected_to tipo_pregunta_url(TipoPregunta.last)
  end

  test "should show tipo_pregunta" do
    get tipo_pregunta_url(@tipo_pregunta)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_pregunta_url(@tipo_pregunta)
    assert_response :success
  end

  test "should update tipo_pregunta" do
    patch tipo_pregunta_url(@tipo_pregunta), params: { tipo_pregunta: { descripcion: @tipo_pregunta.descripcion, estatus: @tipo_pregunta.estatus } }
    assert_redirected_to tipo_pregunta_url(@tipo_pregunta)
  end

  test "should destroy tipo_pregunta" do
    assert_difference('TipoPregunta.count', -1) do
      delete tipo_pregunta_url(@tipo_pregunta)
    end

    assert_redirected_to tipo_preguntas_url
  end
end
