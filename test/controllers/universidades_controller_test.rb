require 'test_helper'

class UniversidadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @universidad = universidades(:one)
  end

  test "should get index" do
    get universidades_url
    assert_response :success
  end

  test "should get new" do
    get new_universidad_url
    assert_response :success
  end

  test "should create universidad" do
    assert_difference('Universidad.count') do
      post universidades_url, params: { universidad: { descripcion: @universidad.descripcion, estatus: @universidad.estatus } }
    end

    assert_redirected_to universidad_url(Universidad.last)
  end

  test "should show universidad" do
    get universidad_url(@universidad)
    assert_response :success
  end

  test "should get edit" do
    get edit_universidad_url(@universidad)
    assert_response :success
  end

  test "should update universidad" do
    patch universidad_url(@universidad), params: { universidad: { descripcion: @universidad.descripcion, estatus: @universidad.estatus } }
    assert_redirected_to universidad_url(@universidad)
  end

  test "should destroy universidad" do
    assert_difference('Universidad.count', -1) do
      delete universidad_url(@universidad)
    end

    assert_redirected_to universidades_url
  end
end
