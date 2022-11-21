require "application_system_test_case"

class PlacesTest < ApplicationSystemTestCase
  setup do
    @place = places(:one)
  end

  test "visiting the index" do
    visit places_url
    assert_selector "h1", text: "Places"
  end

  test "creating a Place" do
    visit places_url
    click_on "New Place"

    fill_in "City", with: @place.city
    fill_in "Country", with: @place.country
    fill_in "Entity", with: @place.entity
    fill_in "Notes", with: @place.notes
    fill_in "Number and street", with: @place.number_and_street
    fill_in "Postal code", with: @place.postal_code
    fill_in "Status", with: @place.status
    fill_in "Suite or apartment", with: @place.suite_or_apartment
    fill_in "Type of address", with: @place.type_of_address
    click_on "Create Place"

    assert_text "Place was successfully created"
    click_on "Back"
  end

  test "updating a Place" do
    visit places_url
    click_on "Edit", match: :first

    fill_in "City", with: @place.city
    fill_in "Country", with: @place.country
    fill_in "Entity", with: @place.entity
    fill_in "Notes", with: @place.notes
    fill_in "Number and street", with: @place.number_and_street
    fill_in "Postal code", with: @place.postal_code
    fill_in "Status", with: @place.status
    fill_in "Suite or apartment", with: @place.suite_or_apartment
    fill_in "Type of address", with: @place.type_of_address
    click_on "Update Place"

    assert_text "Place was successfully updated"
    click_on "Back"
  end

  test "destroying a Place" do
    visit places_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Place was successfully destroyed"
  end
end
