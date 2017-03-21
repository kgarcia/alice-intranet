require 'test_helper'

class AdiccionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adiccion = adicciones(:one)
  end

  test "should get index" do
    get adicciones_url
    assert_response :success
  end

  test "should get new" do
    get new_adiccion_url
    assert_response :success
  end

  test "should create adiccion" do
    assert_difference('Adiccion.count') do
      post adicciones_url, params: { adiccion: { TipoAdiccion_id: @adiccion.TipoAdiccion_id, descripcion: @adiccion.descripcion, estatus: @adiccion.estatus } }
    end

    assert_redirected_to adiccion_url(Adiccion.last)
  end

  test "should show adiccion" do
    get adiccion_url(@adiccion)
    assert_response :success
  end

  test "should get edit" do
    get edit_adiccion_url(@adiccion)
    assert_response :success
  end

  test "should update adiccion" do
    patch adiccion_url(@adiccion), params: { adiccion: { TipoAdiccion_id: @adiccion.TipoAdiccion_id, descripcion: @adiccion.descripcion, estatus: @adiccion.estatus } }
    assert_redirected_to adiccion_url(@adiccion)
  end

  test "should destroy adiccion" do
    assert_difference('Adiccion.count', -1) do
      delete adiccion_url(@adiccion)
    end

    assert_redirected_to adicciones_url
  end
end
