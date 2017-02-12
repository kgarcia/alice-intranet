require 'test_helper'

class HabitosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @habito = habitos(:one)
  end

  test "should get index" do
    get habitos_url
    assert_response :success
  end

  test "should get new" do
    get new_habito_url
    assert_response :success
  end

  test "should create habito" do
    assert_difference('Habito.count') do
      post habitos_url, params: { habito: { TipoHabito_id: @habito.TipoHabito_id, descripcion: @habito.descripcion, estatus: @habito.estatus } }
    end

    assert_redirected_to habito_url(Habito.last)
  end

  test "should show habito" do
    get habito_url(@habito)
    assert_response :success
  end

  test "should get edit" do
    get edit_habito_url(@habito)
    assert_response :success
  end

  test "should update habito" do
    patch habito_url(@habito), params: { habito: { TipoHabito_id: @habito.TipoHabito_id, descripcion: @habito.descripcion, estatus: @habito.estatus } }
    assert_redirected_to habito_url(@habito)
  end

  test "should destroy habito" do
    assert_difference('Habito.count', -1) do
      delete habito_url(@habito)
    end

    assert_redirected_to habitos_url
  end
end
