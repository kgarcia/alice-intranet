require 'test_helper'

class EvaluacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @evaluacion = evaluaciones(:one)
  end

  test "should get index" do
    get evaluaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_evaluacion_url
    assert_response :success
  end

  test "should create evaluacion" do
    assert_difference('Evaluacion.count') do
      post evaluaciones_url, params: { evaluacion: { descripcion: @evaluacion.descripcion, estatus: @evaluacion.estatus, tipo_evaluacion_id: @evaluacion.tipo_evaluacion_id } }
    end

    assert_redirected_to evaluacion_url(Evaluacion.last)
  end

  test "should show evaluacion" do
    get evaluacion_url(@evaluacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_evaluacion_url(@evaluacion)
    assert_response :success
  end

  test "should update evaluacion" do
    patch evaluacion_url(@evaluacion), params: { evaluacion: { descripcion: @evaluacion.descripcion, estatus: @evaluacion.estatus, tipo_evaluacion_id: @evaluacion.tipo_evaluacion_id } }
    assert_redirected_to evaluacion_url(@evaluacion)
  end

  test "should destroy evaluacion" do
    assert_difference('Evaluacion.count', -1) do
      delete evaluacion_url(@evaluacion)
    end

    assert_redirected_to evaluaciones_url
  end
end
