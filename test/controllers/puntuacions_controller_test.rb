require 'test_helper'

class PuntuacionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @puntuacion = puntuacions(:one)
  end

  test "should get index" do
    get puntuacions_url, as: :json
    assert_response :success
  end

  test "should create puntuacion" do
    assert_difference('Puntuacion.count') do
      post puntuacions_url, params: { puntuacion: { fecha: @puntuacion.fecha, puntuacion_obtenida: @puntuacion.puntuacion_obtenida } }, as: :json
    end

    assert_response 201
  end

  test "should show puntuacion" do
    get puntuacion_url(@puntuacion), as: :json
    assert_response :success
  end

  test "should update puntuacion" do
    patch puntuacion_url(@puntuacion), params: { puntuacion: { fecha: @puntuacion.fecha, puntuacion_obtenida: @puntuacion.puntuacion_obtenida } }, as: :json
    assert_response 200
  end

  test "should destroy puntuacion" do
    assert_difference('Puntuacion.count', -1) do
      delete puntuacion_url(@puntuacion), as: :json
    end

    assert_response 204
  end
end
