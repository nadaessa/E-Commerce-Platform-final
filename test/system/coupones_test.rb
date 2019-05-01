require "application_system_test_case"

class CouponesTest < ApplicationSystemTestCase
  setup do
    @coupone = coupones(:one)
  end

  test "visiting the index" do
    visit coupones_url
    assert_selector "h1", text: "Coupones"
  end

  test "creating a Coupone" do
    visit coupones_url
    click_on "New Coupone"

    fill_in "Code", with: @coupone.code
    fill_in "Expiration type", with: @coupone.expiration_type
    fill_in "No of usage", with: @coupone.no_of_usage
    fill_in "Status", with: @coupone.status
    fill_in "Time", with: @coupone.time
    fill_in "Type", with: @coupone.type
    fill_in "Value", with: @coupone.value
    click_on "Create Coupone"

    assert_text "Coupone was successfully created"
    click_on "Back"
  end

  test "updating a Coupone" do
    visit coupones_url
    click_on "Edit", match: :first

    fill_in "Code", with: @coupone.code
    fill_in "Expiration type", with: @coupone.expiration_type
    fill_in "No of usage", with: @coupone.no_of_usage
    fill_in "Status", with: @coupone.status
    fill_in "Time", with: @coupone.time
    fill_in "Type", with: @coupone.type
    fill_in "Value", with: @coupone.value
    click_on "Update Coupone"

    assert_text "Coupone was successfully updated"
    click_on "Back"
  end

  test "destroying a Coupone" do
    visit coupones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Coupone was successfully destroyed"
  end
end
