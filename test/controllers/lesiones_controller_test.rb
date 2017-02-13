require 'test_helper'

class LesionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesion = lesiones(:one)
  end

  test "should get index" do
    get lesiones_url
    assert_response :success
  end

  test "should get new" do
    get new_lesion_url
    assert_response :success
  end

  test "should create lesion" do
    assert_difference('Lesion.count') do
      post lesiones_url, params: { lesion: { TipoLesion_id: @lesion.TipoLesion_id, descripcion: @lesion.descripcion, estatus: @lesion.estatus } }
    end

    assert_redirected_to lesion_url(Lesion.last)
  end

  test "should show lesion" do
    get lesion_url(@lesion)
    assert_response :success
  end

  test "should get edit" do
    get edit_lesion_url(@lesion)
    assert_response :success
  end

  test "should update lesion" do
    patch lesion_url(@lesion), params: { lesion: { TipoLesion_id: @lesion.TipoLesion_id, descripcion: @lesion.descripcion, estatus: @lesion.estatus } }
    assert_redirected_to lesion_url(@lesion)
  end

  test "should destroy lesion" do
    assert_difference('Lesion.count', -1) do
      delete lesion_url(@lesion)
    end

    assert_redirected_to lesiones_url
  end
end
