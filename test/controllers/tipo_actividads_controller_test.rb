require 'test_helper'

class TipoActividadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_actividad = tipo_actividads(:one)
  end

  test "should get index" do
    get tipo_actividads_url, as: :json
    assert_response :success
  end

  test "should create tipo_actividad" do
    assert_difference('TipoActividad.count') do
      post tipo_actividads_url, params: { tipo_actividad: { descripcion: @tipo_actividad.descripcion, nombre: @tipo_actividad.nombre } }, as: :json
    end

    assert_response 201
  end

  test "should show tipo_actividad" do
    get tipo_actividad_url(@tipo_actividad), as: :json
    assert_response :success
  end

  test "should update tipo_actividad" do
    patch tipo_actividad_url(@tipo_actividad), params: { tipo_actividad: { descripcion: @tipo_actividad.descripcion, nombre: @tipo_actividad.nombre } }, as: :json
    assert_response 200
  end

  test "should destroy tipo_actividad" do
    assert_difference('TipoActividad.count', -1) do
      delete tipo_actividad_url(@tipo_actividad), as: :json
    end

    assert_response 204
  end
end
