require "application_system_test_case"

class GuardarobasTest < ApplicationSystemTestCase
  setup do
    @guardaroba = guardarobas(:one)
  end

  test "visiting the index" do
    visit guardarobas_url
    assert_selector "h1", text: "Guardarobas"
  end

  test "should create guardaroba" do
    visit guardarobas_url
    click_on "New guardaroba"

    fill_in "Immagine capo", with: @guardaroba.immagine_capo
    fill_in "Nome capo", with: @guardaroba.nome_capo
    fill_in "User", with: @guardaroba.user_id
    click_on "Create Guardaroba"

    assert_text "Guardaroba was successfully created"
    click_on "Back"
  end

  test "should update Guardaroba" do
    visit guardaroba_url(@guardaroba)
    click_on "Edit this guardaroba", match: :first

    fill_in "Immagine capo", with: @guardaroba.immagine_capo
    fill_in "Nome capo", with: @guardaroba.nome_capo
    fill_in "User", with: @guardaroba.user_id
    click_on "Update Guardaroba"

    assert_text "Guardaroba was successfully updated"
    click_on "Back"
  end

  test "should destroy Guardaroba" do
    visit guardaroba_url(@guardaroba)
    click_on "Destroy this guardaroba", match: :first

    assert_text "Guardaroba was successfully destroyed"
  end
end
