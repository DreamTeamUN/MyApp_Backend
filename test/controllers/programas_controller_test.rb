require 'test_helper'

class ProgramasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @programa = programas(:one)
  end

  test "should get index" do
    get programas_url, as: :json
    assert_response :success
  end

  test "should create programa" do
    assert_difference('Programa.count') do
      post programas_url, params: { programa: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show programa" do
    get programa_url(@programa), as: :json
    assert_response :success
  end

  test "should update programa" do
    patch programa_url(@programa), params: { programa: {  } }, as: :json
    assert_response 200
  end

  test "should destroy programa" do
    assert_difference('Programa.count', -1) do
      delete programa_url(@programa), as: :json
    end

    assert_response 204
  end
end
