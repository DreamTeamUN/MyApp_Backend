require 'test_helper'

class AulasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aula = aulas(:one)
  end

  test "should get index" do
    get aulas_url, as: :json
    assert_response :success
  end

  test "should create aula" do
    assert_difference('Aula.count') do
      post aulas_url, params: { aula: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show aula" do
    get aula_url(@aula), as: :json
    assert_response :success
  end

  test "should update aula" do
    patch aula_url(@aula), params: { aula: {  } }, as: :json
    assert_response 200
  end

  test "should destroy aula" do
    assert_difference('Aula.count', -1) do
      delete aula_url(@aula), as: :json
    end

    assert_response 204
  end
end
