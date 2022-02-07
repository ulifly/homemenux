require "application_system_test_case"

class PlatesTest < ApplicationSystemTestCase
  setup do
    @plate = plates(:one)
  end

  test "visiting the index" do
    visit plates_url
    assert_selector "h1", text: "Plates"
  end

  test "should create plate" do
    visit plates_url
    click_on "New plate"

    fill_in "Ingredient", with: @plate.ingredient_id
    fill_in "Name", with: @plate.name
    click_on "Create Plate"

    assert_text "Plate was successfully created"
    click_on "Back"
  end

  test "should update Plate" do
    visit plate_url(@plate)
    click_on "Edit this plate", match: :first

    fill_in "Ingredient", with: @plate.ingredient_id
    fill_in "Name", with: @plate.name
    click_on "Update Plate"

    assert_text "Plate was successfully updated"
    click_on "Back"
  end

  test "should destroy Plate" do
    visit plate_url(@plate)
    click_on "Destroy this plate", match: :first

    assert_text "Plate was successfully destroyed"
  end
end
