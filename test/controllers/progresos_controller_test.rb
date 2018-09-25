require 'test_helper'

class ProgresosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @progreso = progresos(:one)
  end

  test "should get index" do
    get progresos_url, as: :json
    assert_response :success
  end

  test "should create progreso" do
    assert_difference('Progreso.count') do
      post progresos_url, params: { progreso: { repeticion_completada: @progreso.repeticion_completada } }, as: :json
    end

    assert_response 201
  end

  test "should show progreso" do
    get progreso_url(@progreso), as: :json
    assert_response :success
  end

  test "should update progreso" do
    patch progreso_url(@progreso), params: { progreso: { repeticion_completada: @progreso.repeticion_completada } }, as: :json
    assert_response 200
  end

  test "should destroy progreso" do
    assert_difference('Progreso.count', -1) do
      delete progreso_url(@progreso), as: :json
    end

    assert_response 204
  end
end
