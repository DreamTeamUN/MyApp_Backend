require 'test_helper'

class TipoUsuariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_usuario = tipo_usuarios(:one)
  end

  test "should get index" do
    get tipo_usuarios_url, as: :json
    assert_response :success
  end

  test "should create tipo_usuario" do
    assert_difference('TipoUsuario.count') do
      post tipo_usuarios_url, params: { tipo_usuario: { nombre: @tipo_usuario.nombre } }, as: :json
    end

    assert_response 201
  end

  test "should show tipo_usuario" do
    get tipo_usuario_url(@tipo_usuario), as: :json
    assert_response :success
  end

  test "should update tipo_usuario" do
    patch tipo_usuario_url(@tipo_usuario), params: { tipo_usuario: { nombre: @tipo_usuario.nombre } }, as: :json
    assert_response 200
  end

  test "should destroy tipo_usuario" do
    assert_difference('TipoUsuario.count', -1) do
      delete tipo_usuario_url(@tipo_usuario), as: :json
    end

    assert_response 204
  end
end
