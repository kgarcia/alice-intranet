require 'test_helper'

class TipoHorariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_horario = tipo_horarios(:one)
  end

  test "should get index" do
    get tipo_horarios_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_horario_url
    assert_response :success
  end

  test "should create tipo_horario" do
    assert_difference('TipoHorario.count') do
      post tipo_horarios_url, params: { tipo_horario: { descripcion: @tipo_horario.descripcion, estatus: @tipo_horario.estatus } }
    end

    assert_redirected_to tipo_horario_url(TipoHorario.last)
  end

  test "should show tipo_horario" do
    get tipo_horario_url(@tipo_horario)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_horario_url(@tipo_horario)
    assert_response :success
  end

  test "should update tipo_horario" do
    patch tipo_horario_url(@tipo_horario), params: { tipo_horario: { descripcion: @tipo_horario.descripcion, estatus: @tipo_horario.estatus } }
    assert_redirected_to tipo_horario_url(@tipo_horario)
  end

  test "should destroy tipo_horario" do
    assert_difference('TipoHorario.count', -1) do
      delete tipo_horario_url(@tipo_horario)
    end

    assert_redirected_to tipo_horarios_url
  end
end
