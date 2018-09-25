require 'test_helper'

class TipoJuegosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_juego = tipo_juegos(:one)
  end

  test "should get index" do
    get tipo_juegos_url, as: :json
    assert_response :success
  end

  test "should create tipo_juego" do
    assert_difference('TipoJuego.count') do
      post tipo_juegos_url, params: { tipo_juego: { descripcion: @tipo_juego.descripcion, nombre_juego: @tipo_juego.nombre_juego } }, as: :json
    end

    assert_response 201
  end

  test "should show tipo_juego" do
    get tipo_juego_url(@tipo_juego), as: :json
    assert_response :success
  end

  test "should update tipo_juego" do
    patch tipo_juego_url(@tipo_juego), params: { tipo_juego: { descripcion: @tipo_juego.descripcion, nombre_juego: @tipo_juego.nombre_juego } }, as: :json
    assert_response 200
  end

  test "should destroy tipo_juego" do
    assert_difference('TipoJuego.count', -1) do
      delete tipo_juego_url(@tipo_juego), as: :json
    end

    assert_response 204
  end
end
