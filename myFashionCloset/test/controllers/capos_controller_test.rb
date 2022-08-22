require "test_helper"

class CaposControllerTest < ActionDispatch::IntegrationTest
  setup do
    @capo = capos(:one)
  end

  test "should get index" do
    get capos_url
    assert_response :success
  end

  test "should get new" do
    get new_capo_url
    assert_response :success
  end

  test "should create capo" do
    assert_difference("Capo.count") do
      post capos_url, params: { capo: { descrizione: @capo.descrizione, immagine: @capo.immagine, nome: @capo.nome } }
    end

    assert_redirected_to capo_url(Capo.last)
  end

  test "should show capo" do
    get capo_url(@capo)
    assert_response :success
  end

  test "should get edit" do
    get edit_capo_url(@capo)
    assert_response :success
  end

  test "should update capo" do
    patch capo_url(@capo), params: { capo: { descrizione: @capo.descrizione, immagine: @capo.immagine, nome: @capo.nome } }
    assert_redirected_to capo_url(@capo)
  end

  test "should destroy capo" do
    assert_difference("Capo.count", -1) do
      delete capo_url(@capo)
    end

    assert_redirected_to capos_url
  end
end
