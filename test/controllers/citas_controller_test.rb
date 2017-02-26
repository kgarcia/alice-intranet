require 'test_helper'

class CitasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cita = citas(:one)
  end

  test "should get index" do
    get citas_url
    assert_response :success
  end

  test "should get new" do
    get new_cita_url
    assert_response :success
  end

  test "should create cita" do
    assert_difference('Cita.count') do
      post citas_url, params: { cita: { estatus: @cita.estatus, fecha: @cita.fecha, persona_id: @cita.persona_id, tipo_cita_id: @cita.tipo_cita_id, tipo_pago_id: @cita.tipo_pago_id, turno_id: @cita.turno_id, usuario_id: @cita.usuario_id } }
    end

    assert_redirected_to cita_url(Cita.last)
  end

  test "should show cita" do
    get cita_url(@cita)
    assert_response :success
  end

  test "should get edit" do
    get edit_cita_url(@cita)
    assert_response :success
  end

  test "should update cita" do
    patch cita_url(@cita), params: { cita: { estatus: @cita.estatus, fecha: @cita.fecha, persona_id: @cita.persona_id, tipo_cita_id: @cita.tipo_cita_id, tipo_pago_id: @cita.tipo_pago_id, turno_id: @cita.turno_id, usuario_id: @cita.usuario_id } }
    assert_redirected_to cita_url(@cita)
  end

  test "should destroy cita" do
    assert_difference('Cita.count', -1) do
      delete cita_url(@cita)
    end

    assert_redirected_to citas_url
  end
end
