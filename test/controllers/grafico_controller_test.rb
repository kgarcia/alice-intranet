require 'test_helper'

class GraficoControllerTest < ActionDispatch::IntegrationTest
  test "should get generar" do
    get grafico_generar_url
    assert_response :success
  end

  test "should get ver" do
    get grafico_ver_url
    assert_response :success
  end

end
