require 'test_helper'

class EstudianteAulasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estudiante_aula = estudiante_aulas(:one)
  end

  test "should get index" do
    get estudiante_aulas_url, as: :json
    assert_response :success
  end

  test "should create estudiante_aula" do
    assert_difference('EstudianteAula.count') do
      post estudiante_aulas_url, params: { estudiante_aula: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show estudiante_aula" do
    get estudiante_aula_url(@estudiante_aula), as: :json
    assert_response :success
  end

  test "should update estudiante_aula" do
    patch estudiante_aula_url(@estudiante_aula), params: { estudiante_aula: {  } }, as: :json
    assert_response 200
  end

  test "should destroy estudiante_aula" do
    assert_difference('EstudianteAula.count', -1) do
      delete estudiante_aula_url(@estudiante_aula), as: :json
    end

    assert_response 204
  end
end
