require 'test_helper'

class ArchivoJuegosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @archivo_juego = archivo_juegos(:one)
  end

  test "should get index" do
    get archivo_juegos_url, as: :json
    assert_response :success
  end

  test "should create archivo_juego" do
    assert_difference('ArchivoJuego.count') do
      post archivo_juegos_url, params: { archivo_juego: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show archivo_juego" do
    get archivo_juego_url(@archivo_juego), as: :json
    assert_response :success
  end

  test "should update archivo_juego" do
    patch archivo_juego_url(@archivo_juego), params: { archivo_juego: {  } }, as: :json
    assert_response 200
  end

  test "should destroy archivo_juego" do
    assert_difference('ArchivoJuego.count', -1) do
      delete archivo_juego_url(@archivo_juego), as: :json
    end

    assert_response 204
  end
end
