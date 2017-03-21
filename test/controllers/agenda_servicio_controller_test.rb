require 'test_helper'

class AgendaServicioControllerTest < ActionDispatch::IntegrationTest
  test "should get lista" do
    get agenda_servicio_lista_url
    assert_response :success
  end

  test "should get detalle" do
    get agenda_servicio_detalle_url
    assert_response :success
  end

end
