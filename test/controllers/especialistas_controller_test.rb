require 'test_helper'

class EspecialistasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @especialista = especialistas(:one)
  end

  test "should get index" do
    get especialistas_url
    assert_response :success
  end

  test "should get new" do
    get new_especialista_url
    assert_response :success
  end

  test "should create especialista" do
    assert_difference('Especialista.count') do
      post especialistas_url, params: { especialista: { descripcion: @especialista.descripcion, especialidad_id: @especialista.especialidad_id, estatus: @especialista.estatus } }
    end

    assert_redirected_to especialista_url(Especialista.last)
  end

  test "should show especialista" do
    get especialista_url(@especialista)
    assert_response :success
  end

  test "should get edit" do
    get edit_especialista_url(@especialista)
    assert_response :success
  end

  test "should update especialista" do
    patch especialista_url(@especialista), params: { especialista: { descripcion: @especialista.descripcion, especialidad_id: @especialista.especialidad_id, estatus: @especialista.estatus } }
    assert_redirected_to especialista_url(@especialista)
  end

  test "should destroy especialista" do
    assert_difference('Especialista.count', -1) do
      delete especialista_url(@especialista)
    end

    assert_redirected_to especialistas_url
  end
end
