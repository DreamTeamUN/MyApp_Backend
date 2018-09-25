require 'test_helper'

class FrasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @frase = frases(:one)
  end

  test "should get index" do
    get frases_url, as: :json
    assert_response :success
  end

  test "should create frase" do
    assert_difference('Frase.count') do
      post frases_url, params: { frase: { frase: @frase.frase } }, as: :json
    end

    assert_response 201
  end

  test "should show frase" do
    get frase_url(@frase), as: :json
    assert_response :success
  end

  test "should update frase" do
    patch frase_url(@frase), params: { frase: { frase: @frase.frase } }, as: :json
    assert_response 200
  end

  test "should destroy frase" do
    assert_difference('Frase.count', -1) do
      delete frase_url(@frase), as: :json
    end

    assert_response 204
  end
end
