require 'test_helper'

class TipoPatologiasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_patologia = tipo_patologias(:one)
  end

  test "should get index" do
    get tipo_patologias_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_patologia_url
    assert_response :success
  end

  test "should create tipo_patologia" do
    assert_difference('TipoPatologia.count') do
      post tipo_patologias_url, params: { tipo_patologia: { descripcion: @tipo_patologia.descripcion, estatus: @tipo_patologia.estatus } }
    end

    assert_redirected_to tipo_patologia_url(TipoPatologia.last)
  end

  test "should show tipo_patologia" do
    get tipo_patologia_url(@tipo_patologia)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_patologia_url(@tipo_patologia)
    assert_response :success
  end

  test "should update tipo_patologia" do
    patch tipo_patologia_url(@tipo_patologia), params: { tipo_patologia: { descripcion: @tipo_patologia.descripcion, estatus: @tipo_patologia.estatus } }
    assert_redirected_to tipo_patologia_url(@tipo_patologia)
  end

  test "should destroy tipo_patologia" do
    assert_difference('TipoPatologia.count', -1) do
      delete tipo_patologia_url(@tipo_patologia)
    end

    assert_redirected_to tipo_patologias_url
  end
end
