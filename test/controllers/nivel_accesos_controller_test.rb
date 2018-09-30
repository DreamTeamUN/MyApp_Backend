require 'test_helper'

class NivelAccesosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nivel_acceso = nivel_accesos(:one)
  end

  test "should get index" do
    get nivel_accesos_url, as: :json
    assert_response :success
  end

  test "should create nivel_acceso" do
    assert_difference('NivelAcceso.count') do
      post nivel_accesos_url, params: { nivel_acceso: { nombre: @nivel_acceso.nombre } }, as: :json
    end

    assert_response 201
  end

  test "should show nivel_acceso" do
    get nivel_acceso_url(@nivel_acceso), as: :json
    assert_response :success
  end

  test "should update nivel_acceso" do
    patch nivel_acceso_url(@nivel_acceso), params: { nivel_acceso: { nombre: @nivel_acceso.nombre } }, as: :json
    assert_response 200
  end

  test "should destroy nivel_acceso" do
    assert_difference('NivelAcceso.count', -1) do
      delete nivel_acceso_url(@nivel_acceso), as: :json
    end

    assert_response 204
  end
end
