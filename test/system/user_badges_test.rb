require "application_system_test_case"

class UserBadgesTest < ApplicationSystemTestCase
  setup do
    @user_badge = user_badges(:one)
  end

  test "visiting the index" do
    visit user_badges_url
    assert_selector "h1", text: "User Badges"
  end

  test "creating a User badge" do
    visit user_badges_url
    click_on "New User Badge"

    fill_in "Badge", with: @user_badge.badge_id
    fill_in "User", with: @user_badge.user_id
    click_on "Create User badge"

    assert_text "User badge was successfully created"
    click_on "Back"
  end

  test "updating a User badge" do
    visit user_badges_url
    click_on "Edit", match: :first

    fill_in "Badge", with: @user_badge.badge_id
    fill_in "User", with: @user_badge.user_id
    click_on "Update User badge"

    assert_text "User badge was successfully updated"
    click_on "Back"
  end

  test "destroying a User badge" do
    visit user_badges_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User badge was successfully destroyed"
  end
end
