require 'test_helper'

class EntradasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entrada = entradas(:one)
  end

  test "should get index" do
    get entradas_url, as: :json
    assert_response :success
  end

  test "should create entrada" do
    assert_difference('Entrada.count') do
      post entradas_url, params: { entrada: { abierto: @entrada.abierto, fecha_publicacion: @entrada.fecha_publicacion, publicado: @entrada.publicado, ramificacion: @entrada.ramificacion } }, as: :json
    end

    assert_response 201
  end

  test "should show entrada" do
    get entrada_url(@entrada), as: :json
    assert_response :success
  end

  test "should update entrada" do
    patch entrada_url(@entrada), params: { entrada: { abierto: @entrada.abierto, fecha_publicacion: @entrada.fecha_publicacion, publicado: @entrada.publicado, ramificacion: @entrada.ramificacion } }, as: :json
    assert_response 200
  end

  test "should destroy entrada" do
    assert_difference('Entrada.count', -1) do
      delete entrada_url(@entrada), as: :json
    end

    assert_response 204
  end
end
