require "application_system_test_case"

class MapsTest < ApplicationSystemTestCase
  setup do
    @map = maps(:one)
  end

  test "visiting the index" do
    visit maps_url
    assert_selector "h1", text: "Maps"
  end

  test "creating a Map" do
    visit maps_url
    click_on "New Map"

    fill_in "Client name", with: @map.client_name
    fill_in "Full name of technical contact", with: @map.full_name_of_technical_contact
    fill_in "Lat", with: @map.lat
    fill_in "Location of building", with: @map.location_of_building
    fill_in "Long", with: @map.long
    fill_in "Number of batteries", with: @map.number_of_batteries
    fill_in "Number of columns", with: @map.number_of_columns
    fill_in "Number of elevators", with: @map.number_of_elevators
    fill_in "Number of floors", with: @map.number_of_floors
    click_on "Create Map"

    assert_text "Map was successfully created"
    click_on "Back"
  end

  test "updating a Map" do
    visit maps_url
    click_on "Edit", match: :first

    fill_in "Client name", with: @map.client_name
    fill_in "Full name of technical contact", with: @map.full_name_of_technical_contact
    fill_in "Lat", with: @map.lat
    fill_in "Location of building", with: @map.location_of_building
    fill_in "Long", with: @map.long
    fill_in "Number of batteries", with: @map.number_of_batteries
    fill_in "Number of columns", with: @map.number_of_columns
    fill_in "Number of elevators", with: @map.number_of_elevators
    fill_in "Number of floors", with: @map.number_of_floors
    click_on "Update Map"

    assert_text "Map was successfully updated"
    click_on "Back"
  end

  test "destroying a Map" do
    visit maps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Map was successfully destroyed"
  end
end
