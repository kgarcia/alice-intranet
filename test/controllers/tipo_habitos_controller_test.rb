require 'test_helper'

class TipoHabitosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_habito = tipo_habitos(:one)
  end

  test "should get index" do
    get tipo_habitos_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_habito_url
    assert_response :success
  end

  test "should create tipo_habito" do
    assert_difference('TipoHabito.count') do
      post tipo_habitos_url, params: { tipo_habito: { descripcion: @tipo_habito.descripcion, estatus: @tipo_habito.estatus } }
    end

    assert_redirected_to tipo_habito_url(TipoHabito.last)
  end

  test "should show tipo_habito" do
    get tipo_habito_url(@tipo_habito)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_habito_url(@tipo_habito)
    assert_response :success
  end

  test "should update tipo_habito" do
    patch tipo_habito_url(@tipo_habito), params: { tipo_habito: { descripcion: @tipo_habito.descripcion, estatus: @tipo_habito.estatus } }
    assert_redirected_to tipo_habito_url(@tipo_habito)
  end

  test "should destroy tipo_habito" do
    assert_difference('TipoHabito.count', -1) do
      delete tipo_habito_url(@tipo_habito)
    end

    assert_redirected_to tipo_habitos_url
  end
end
