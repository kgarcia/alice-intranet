require 'test_helper'

class TipoTurnosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_turno = tipo_turnos(:one)
  end

  test "should get index" do
    get tipo_turnos_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_turno_url
    assert_response :success
  end

  test "should create tipo_turno" do
    assert_difference('TipoTurno.count') do
      post tipo_turnos_url, params: { tipo_turno: { descripcion: @tipo_turno.descripcion } }
    end

    assert_redirected_to tipo_turno_url(TipoTurno.last)
  end

  test "should show tipo_turno" do
    get tipo_turno_url(@tipo_turno)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_turno_url(@tipo_turno)
    assert_response :success
  end

  test "should update tipo_turno" do
    patch tipo_turno_url(@tipo_turno), params: { tipo_turno: { descripcion: @tipo_turno.descripcion } }
    assert_redirected_to tipo_turno_url(@tipo_turno)
  end

  test "should destroy tipo_turno" do
    assert_difference('TipoTurno.count', -1) do
      delete tipo_turno_url(@tipo_turno)
    end

    assert_redirected_to tipo_turnos_url
  end
end
