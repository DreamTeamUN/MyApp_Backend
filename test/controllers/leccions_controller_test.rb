require 'test_helper'

class LeccionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @leccion = leccions(:one)
  end

  test "should get index" do
    get leccions_url, as: :json
    assert_response :success
  end

  test "should create leccion" do
    assert_difference('Leccion.count') do
      post leccions_url, params: { leccion: { semana: @leccion.semana } }, as: :json
    end

    assert_response 201
  end

  test "should show leccion" do
    get leccion_url(@leccion), as: :json
    assert_response :success
  end

  test "should update leccion" do
    patch leccion_url(@leccion), params: { leccion: { semana: @leccion.semana } }, as: :json
    assert_response 200
  end

  test "should destroy leccion" do
    assert_difference('Leccion.count', -1) do
      delete leccion_url(@leccion), as: :json
    end

    assert_response 204
  end
end
