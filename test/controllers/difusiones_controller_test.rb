require 'test_helper'

class DifusionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @difusion = difusiones(:one)
  end

  test "should get index" do
    get difusiones_url
    assert_response :success
  end

  test "should get new" do
    get new_difusion_url
    assert_response :success
  end

  test "should create difusion" do
    assert_difference('Difusion.count') do
      post difusiones_url, params: { difusion: { asunto: @difusion.asunto, entidad_id: @difusion.entidad_id, estatus: @difusion.estatus, imagen: @difusion.imagen, texto: @difusion.texto, tipo_difusion_id: @difusion.tipo_difusion_id, tipo_entidad_id: @difusion.tipo_entidad_id, token_facebook: @difusion.token_facebook } }
    end

    assert_redirected_to difusion_url(Difusion.last)
  end

  test "should show difusion" do
    get difusion_url(@difusion)
    assert_response :success
  end

  test "should get edit" do
    get edit_difusion_url(@difusion)
    assert_response :success
  end

  test "should update difusion" do
    patch difusion_url(@difusion), params: { difusion: { asunto: @difusion.asunto, entidad_id: @difusion.entidad_id, estatus: @difusion.estatus, imagen: @difusion.imagen, texto: @difusion.texto, tipo_difusion_id: @difusion.tipo_difusion_id, tipo_entidad_id: @difusion.tipo_entidad_id, token_facebook: @difusion.token_facebook } }
    assert_redirected_to difusion_url(@difusion)
  end

  test "should destroy difusion" do
    assert_difference('Difusion.count', -1) do
      delete difusion_url(@difusion)
    end

    assert_redirected_to difusiones_url
  end
end
