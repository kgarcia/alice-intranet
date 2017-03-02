require 'test_helper'

class TipoParentescosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_parentesco = tipo_parentescos(:one)
  end

  test "should get index" do
    get tipo_parentescos_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_parentesco_url
    assert_response :success
  end

  test "should create tipo_parentesco" do
    assert_difference('TipoParentesco.count') do
      post tipo_parentescos_url, params: { tipo_parentesco: { descripcion: @tipo_parentesco.descripcion, estatus: @tipo_parentesco.estatus } }
    end

    assert_redirected_to tipo_parentesco_url(TipoParentesco.last)
  end

  test "should show tipo_parentesco" do
    get tipo_parentesco_url(@tipo_parentesco)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_parentesco_url(@tipo_parentesco)
    assert_response :success
  end

  test "should update tipo_parentesco" do
    patch tipo_parentesco_url(@tipo_parentesco), params: { tipo_parentesco: { descripcion: @tipo_parentesco.descripcion, estatus: @tipo_parentesco.estatus } }
    assert_redirected_to tipo_parentesco_url(@tipo_parentesco)
  end

  test "should destroy tipo_parentesco" do
    assert_difference('TipoParentesco.count', -1) do
      delete tipo_parentesco_url(@tipo_parentesco)
    end

    assert_redirected_to tipo_parentescos_url
  end
end
