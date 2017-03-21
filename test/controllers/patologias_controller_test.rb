require 'test_helper'

class PatologiasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patologia = patologias(:one)
  end

  test "should get index" do
    get patologias_url
    assert_response :success
  end

  test "should get new" do
    get new_patologia_url
    assert_response :success
  end

  test "should create patologia" do
    assert_difference('Patologia.count') do
      post patologias_url, params: { patologia: { TipoPatologia_id: @patologia.TipoPatologia_id, descripcion: @patologia.descripcion, estatus: @patologia.estatus } }
    end

    assert_redirected_to patologia_url(Patologia.last)
  end

  test "should show patologia" do
    get patologia_url(@patologia)
    assert_response :success
  end

  test "should get edit" do
    get edit_patologia_url(@patologia)
    assert_response :success
  end

  test "should update patologia" do
    patch patologia_url(@patologia), params: { patologia: { TipoPatologia_id: @patologia.TipoPatologia_id, descripcion: @patologia.descripcion, estatus: @patologia.estatus } }
    assert_redirected_to patologia_url(@patologia)
  end

  test "should destroy patologia" do
    assert_difference('Patologia.count', -1) do
      delete patologia_url(@patologia)
    end

    assert_redirected_to patologias_url
  end
end
