require 'test_helper'

class OptionMenusControllerTest < ActionController::TestCase
  setup do
    @option_menu = option_menus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:option_menus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create option_menu" do
    assert_difference('OptionMenu.count') do
      post :create, option_menu: { accion: @option_menu.accion, controlador: @option_menu.controlador, estatus: @option_menu.estatus, icono: @option_menu.icono, id_padre: @option_menu.id_padre, nombre: @option_menu.nombre, num_hijos: @option_menu.num_hijos, url_path: @option_menu.url_path }
    end

    assert_redirected_to option_menu_path(assigns(:option_menu))
  end

  test "should show option_menu" do
    get :show, id: @option_menu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @option_menu
    assert_response :success
  end

  test "should update option_menu" do
    patch :update, id: @option_menu, option_menu: { accion: @option_menu.accion, controlador: @option_menu.controlador, estatus: @option_menu.estatus, icono: @option_menu.icono, id_padre: @option_menu.id_padre, nombre: @option_menu.nombre, num_hijos: @option_menu.num_hijos, url_path: @option_menu.url_path }
    assert_redirected_to option_menu_path(assigns(:option_menu))
  end

  test "should destroy option_menu" do
    assert_difference('OptionMenu.count', -1) do
      delete :destroy, id: @option_menu
    end

    assert_redirected_to option_menus_path
  end
end
