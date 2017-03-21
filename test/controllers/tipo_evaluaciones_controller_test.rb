require 'test_helper'

class TipoEvaluacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_evaluacion = tipo_evaluaciones(:one)
  end

  test "should get index" do
    get tipo_evaluaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_evaluacion_url
    assert_response :success
  end

  test "should create tipo_evaluacion" do
    assert_difference('TipoEvaluacion.count') do
      post tipo_evaluaciones_url, params: { tipo_evaluacion: { descripcion: @tipo_evaluacion.descripcion, estatus: @tipo_evaluacion.estatus } }
    end

    assert_redirected_to tipo_evaluacion_url(TipoEvaluacion.last)
  end

  test "should show tipo_evaluacion" do
    get tipo_evaluacion_url(@tipo_evaluacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_evaluacion_url(@tipo_evaluacion)
    assert_response :success
  end

  test "should update tipo_evaluacion" do
    patch tipo_evaluacion_url(@tipo_evaluacion), params: { tipo_evaluacion: { descripcion: @tipo_evaluacion.descripcion, estatus: @tipo_evaluacion.estatus } }
    assert_redirected_to tipo_evaluacion_url(@tipo_evaluacion)
  end

  test "should destroy tipo_evaluacion" do
    assert_difference('TipoEvaluacion.count', -1) do
      delete tipo_evaluacion_url(@tipo_evaluacion)
    end

    assert_redirected_to tipo_evaluaciones_url
  end
end
