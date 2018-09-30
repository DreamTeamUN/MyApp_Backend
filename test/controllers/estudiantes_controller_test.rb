require 'test_helper'

class EstudiantesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estudiante = estudiantes(:one)
  end

  test "should get index" do
    get estudiantes_url, as: :json
    assert_response :success
  end

  test "should create estudiante" do
    assert_difference('Estudiante.count') do
      post estudiantes_url, params: { estudiante: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show estudiante" do
    get estudiante_url(@estudiante), as: :json
    assert_response :success
  end

  test "should update estudiante" do
    patch estudiante_url(@estudiante), params: { estudiante: {  } }, as: :json
    assert_response 200
  end

  test "should destroy estudiante" do
    assert_difference('Estudiante.count', -1) do
      delete estudiante_url(@estudiante), as: :json
    end

    assert_response 204
  end
end
