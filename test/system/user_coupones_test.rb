require "application_system_test_case"

class UserCouponesTest < ApplicationSystemTestCase
  setup do
    @user_coupone = user_coupones(:one)
  end

  test "visiting the index" do
    visit user_coupones_url
    assert_selector "h1", text: "User Coupones"
  end

  test "creating a User coupone" do
    visit user_coupones_url
    click_on "New User Coupone"

    fill_in "Coupone", with: @user_coupone.coupone_id
    fill_in "User", with: @user_coupone.user_id
    click_on "Create User coupone"

    assert_text "User coupone was successfully created"
    click_on "Back"
  end

  test "updating a User coupone" do
    visit user_coupones_url
    click_on "Edit", match: :first

    fill_in "Coupone", with: @user_coupone.coupone_id
    fill_in "User", with: @user_coupone.user_id
    click_on "Update User coupone"

    assert_text "User coupone was successfully updated"
    click_on "Back"
  end

  test "destroying a User coupone" do
    visit user_coupones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User coupone was successfully destroyed"
  end
end
