require 'test_helper'

class FrasePnlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @frase_pnl = frase_pnls(:one)
  end

  test "should get index" do
    get frase_pnls_url, as: :json
    assert_response :success
  end

  test "should create frase_pnl" do
    assert_difference('FrasePnl.count') do
      post frase_pnls_url, params: { frase_pnl: { frase: @frase_pnl.frase } }, as: :json
    end

    assert_response 201
  end

  test "should show frase_pnl" do
    get frase_pnl_url(@frase_pnl), as: :json
    assert_response :success
  end

  test "should update frase_pnl" do
    patch frase_pnl_url(@frase_pnl), params: { frase_pnl: { frase: @frase_pnl.frase } }, as: :json
    assert_response 200
  end

  test "should destroy frase_pnl" do
    assert_difference('FrasePnl.count', -1) do
      delete frase_pnl_url(@frase_pnl), as: :json
    end

    assert_response 204
  end
end
