require "test_helper"

class GuardarobasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guardaroba = guardarobas(:one)
  end

  test "should get index" do
    get guardarobas_url
    assert_response :success
  end

  test "should get new" do
    get new_guardaroba_url
    assert_response :success
  end

  test "should create guardaroba" do
    assert_difference("Guardaroba.count") do
      post guardarobas_url, params: { guardaroba: { immagine_capo: @guardaroba.immagine_capo, nome_capo: @guardaroba.nome_capo, user_id: @guardaroba.user_id } }
    end

    assert_redirected_to guardaroba_url(Guardaroba.last)
  end

  test "should show guardaroba" do
    get guardaroba_url(@guardaroba)
    assert_response :success
  end

  test "should get edit" do
    get edit_guardaroba_url(@guardaroba)
    assert_response :success
  end

  test "should update guardaroba" do
    patch guardaroba_url(@guardaroba), params: { guardaroba: { immagine_capo: @guardaroba.immagine_capo, nome_capo: @guardaroba.nome_capo, user_id: @guardaroba.user_id } }
    assert_redirected_to guardaroba_url(@guardaroba)
  end

  test "should destroy guardaroba" do
    assert_difference("Guardaroba.count", -1) do
      delete guardaroba_url(@guardaroba)
    end

    assert_redirected_to guardarobas_url
  end
end
