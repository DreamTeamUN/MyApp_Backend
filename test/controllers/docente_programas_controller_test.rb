require 'test_helper'

class DocenteProgramasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @docente_programa = docente_programas(:one)
  end

  test "should get index" do
    get docente_programas_url, as: :json
    assert_response :success
  end

  test "should create docente_programa" do
    assert_difference('DocentePrograma.count') do
      post docente_programas_url, params: { docente_programa: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show docente_programa" do
    get docente_programa_url(@docente_programa), as: :json
    assert_response :success
  end

  test "should update docente_programa" do
    patch docente_programa_url(@docente_programa), params: { docente_programa: {  } }, as: :json
    assert_response 200
  end

  test "should destroy docente_programa" do
    assert_difference('DocentePrograma.count', -1) do
      delete docente_programa_url(@docente_programa), as: :json
    end

    assert_response 204
  end
end
