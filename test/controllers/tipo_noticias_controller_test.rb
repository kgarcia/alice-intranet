require 'test_helper'

class TipoNoticiasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_noticia = tipo_noticias(:one)
  end

  test "should get index" do
    get tipo_noticias_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_noticia_url
    assert_response :success
  end

  test "should create tipo_noticia" do
    assert_difference('TipoNoticia.count') do
      post tipo_noticias_url, params: { tipo_noticia: { descripcion: @tipo_noticia.descripcion, estatus: @tipo_noticia.estatus } }
    end

    assert_redirected_to tipo_noticia_url(TipoNoticia.last)
  end

  test "should show tipo_noticia" do
    get tipo_noticia_url(@tipo_noticia)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_noticia_url(@tipo_noticia)
    assert_response :success
  end

  test "should update tipo_noticia" do
    patch tipo_noticia_url(@tipo_noticia), params: { tipo_noticia: { descripcion: @tipo_noticia.descripcion, estatus: @tipo_noticia.estatus } }
    assert_redirected_to tipo_noticia_url(@tipo_noticia)
  end

  test "should destroy tipo_noticia" do
    assert_difference('TipoNoticia.count', -1) do
      delete tipo_noticia_url(@tipo_noticia)
    end

    assert_redirected_to tipo_noticias_url
  end
end
