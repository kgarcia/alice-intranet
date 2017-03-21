require 'test_helper'

class ProfesionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profesion = profesiones(:one)
  end

  test "should get index" do
    get profesiones_url
    assert_response :success
  end

  test "should get new" do
    get new_profesion_url
    assert_response :success
  end

  test "should create profesion" do
    assert_difference('Profesion.count') do
      post profesiones_url, params: { profesion: { descripcion: @profesion.descripcion, estatus: @profesion.estatus } }
    end

    assert_redirected_to profesion_url(Profesion.last)
  end

  test "should show profesion" do
    get profesion_url(@profesion)
    assert_response :success
  end

  test "should get edit" do
    get edit_profesion_url(@profesion)
    assert_response :success
  end

  test "should update profesion" do
    patch profesion_url(@profesion), params: { profesion: { descripcion: @profesion.descripcion, estatus: @profesion.estatus } }
    assert_redirected_to profesion_url(@profesion)
  end

  test "should destroy profesion" do
    assert_difference('Profesion.count', -1) do
      delete profesion_url(@profesion)
    end

    assert_redirected_to profesiones_url
  end
end
