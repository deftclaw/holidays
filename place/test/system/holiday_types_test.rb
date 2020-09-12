require "application_system_test_case"

class HolidayTypesTest < ApplicationSystemTestCase
  setup do
    @holiday_type = holiday_types(:one)
  end

  test "visiting the index" do
    visit holiday_types_url
    assert_selector "h1", text: "Holiday Types"
  end

  test "creating a Holiday type" do
    visit holiday_types_url
    click_on "New Holiday Type"

    fill_in "Name", with: @holiday_type.name
    click_on "Create Holiday type"

    assert_text "Holiday type was successfully created"
    click_on "Back"
  end

  test "updating a Holiday type" do
    visit holiday_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @holiday_type.name
    click_on "Update Holiday type"

    assert_text "Holiday type was successfully updated"
    click_on "Back"
  end

  test "destroying a Holiday type" do
    visit holiday_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Holiday type was successfully destroyed"
  end
end
