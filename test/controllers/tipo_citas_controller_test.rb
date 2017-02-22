require 'test_helper'

class TipoCitasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_cita = tipo_citas(:one)
  end

  test "should get index" do
    get tipo_citas_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_cita_url
    assert_response :success
  end

  test "should create tipo_cita" do
    assert_difference('TipoCita.count') do
      post tipo_citas_url, params: { tipo_cita: { descripcion: @tipo_cita.descripcion, estatus: @tipo_cita.estatus } }
    end

    assert_redirected_to tipo_cita_url(TipoCita.last)
  end

  test "should show tipo_cita" do
    get tipo_cita_url(@tipo_cita)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_cita_url(@tipo_cita)
    assert_response :success
  end

  test "should update tipo_cita" do
    patch tipo_cita_url(@tipo_cita), params: { tipo_cita: { descripcion: @tipo_cita.descripcion, estatus: @tipo_cita.estatus } }
    assert_redirected_to tipo_cita_url(@tipo_cita)
  end

  test "should destroy tipo_cita" do
    assert_difference('TipoCita.count', -1) do
      delete tipo_cita_url(@tipo_cita)
    end

    assert_redirected_to tipo_citas_url
  end
end
