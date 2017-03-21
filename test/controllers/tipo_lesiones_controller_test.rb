require 'test_helper'

class TipoLesionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_lesion = tipo_lesiones(:one)
  end

  test "should get index" do
    get tipo_lesiones_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_lesion_url
    assert_response :success
  end

  test "should create tipo_lesion" do
    assert_difference('TipoLesion.count') do
      post tipo_lesiones_url, params: { tipo_lesion: { descripcion: @tipo_lesion.descripcion, estatus: @tipo_lesion.estatus } }
    end

    assert_redirected_to tipo_lesion_url(TipoLesion.last)
  end

  test "should show tipo_lesion" do
    get tipo_lesion_url(@tipo_lesion)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_lesion_url(@tipo_lesion)
    assert_response :success
  end

  test "should update tipo_lesion" do
    patch tipo_lesion_url(@tipo_lesion), params: { tipo_lesion: { descripcion: @tipo_lesion.descripcion, estatus: @tipo_lesion.estatus } }
    assert_redirected_to tipo_lesion_url(@tipo_lesion)
  end

  test "should destroy tipo_lesion" do
    assert_difference('TipoLesion.count', -1) do
      delete tipo_lesion_url(@tipo_lesion)
    end

    assert_redirected_to tipo_lesiones_url
  end
end
