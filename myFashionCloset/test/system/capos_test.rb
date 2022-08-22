require "application_system_test_case"

class CaposTest < ApplicationSystemTestCase
  setup do
    @capo = capos(:one)
  end

  test "visiting the index" do
    visit capos_url
    assert_selector "h1", text: "Capos"
  end

  test "should create capo" do
    visit capos_url
    click_on "New capo"

    fill_in "Descrizione", with: @capo.descrizione
    fill_in "Immagine", with: @capo.immagine
    fill_in "Nome", with: @capo.nome
    click_on "Create Capo"

    assert_text "Capo was successfully created"
    click_on "Back"
  end

  test "should update Capo" do
    visit capo_url(@capo)
    click_on "Edit this capo", match: :first

    fill_in "Descrizione", with: @capo.descrizione
    fill_in "Immagine", with: @capo.immagine
    fill_in "Nome", with: @capo.nome
    click_on "Update Capo"

    assert_text "Capo was successfully updated"
    click_on "Back"
  end

  test "should destroy Capo" do
    visit capo_url(@capo)
    click_on "Destroy this capo", match: :first

    assert_text "Capo was successfully destroyed"
  end
end
