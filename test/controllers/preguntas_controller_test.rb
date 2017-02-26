require 'test_helper'

class PreguntasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pregunta = preguntas(:one)
  end

  test "should get index" do
    get preguntas_url
    assert_response :success
  end

  test "should get new" do
    get new_pregunta_url
    assert_response :success
  end

  test "should create pregunta" do
    assert_difference('Pregunta.count') do
      post preguntas_url, params: { pregunta: { descripcion: @pregunta.descripcion, estatus: @pregunta.estatus, respuesta: @pregunta.respuesta, tipo_pregunta_id: @pregunta.tipo_pregunta_id, titulo: @pregunta.titulo } }
    end

    assert_redirected_to pregunta_url(Pregunta.last)
  end

  test "should show pregunta" do
    get pregunta_url(@pregunta)
    assert_response :success
  end

  test "should get edit" do
    get edit_pregunta_url(@pregunta)
    assert_response :success
  end

  test "should update pregunta" do
    patch pregunta_url(@pregunta), params: { pregunta: { descripcion: @pregunta.descripcion, estatus: @pregunta.estatus, respuesta: @pregunta.respuesta, tipo_pregunta_id: @pregunta.tipo_pregunta_id, titulo: @pregunta.titulo } }
    assert_redirected_to pregunta_url(@pregunta)
  end

  test "should destroy pregunta" do
    assert_difference('Pregunta.count', -1) do
      delete pregunta_url(@pregunta)
    end

    assert_redirected_to preguntas_url
  end
end
