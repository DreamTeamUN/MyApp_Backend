require 'test_helper'

class RegistroActividadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registro_actividad = registro_actividads(:one)
  end

  test "should get index" do
    get registro_actividads_url, as: :json
    assert_response :success
  end

  test "should create registro_actividad" do
    assert_difference('RegistroActividad.count') do
      post registro_actividads_url, params: { registro_actividad: { fecha: @registro_actividad.fecha } }, as: :json
    end

    assert_response 201
  end

  test "should show registro_actividad" do
    get registro_actividad_url(@registro_actividad), as: :json
    assert_response :success
  end

  test "should update registro_actividad" do
    patch registro_actividad_url(@registro_actividad), params: { registro_actividad: { fecha: @registro_actividad.fecha } }, as: :json
    assert_response 200
  end

  test "should destroy registro_actividad" do
    assert_difference('RegistroActividad.count', -1) do
      delete registro_actividad_url(@registro_actividad), as: :json
    end

    assert_response 204
  end
end
