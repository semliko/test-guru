require "test_helper"

class Admin::BadgesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @badge = badges(:one)
  end

  test "should get index" do
    get admin_badges_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_badge_url
    assert_response :success
  end

  test "should create badge" do
    assert_difference('Badge.count') do
      post admin_badges_url, params: { badge: { image_url: @badge.image_url, name: @badge.name } }
    end

    assert_redirected_to badge_url(Badge.last)
  end

  test "should show badge" do
    get admin_badge_url(@badge)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_badge_url(@badge)
    assert_response :success
  end

  test "should update badge" do
    patch admin_badge_url(@badge), params: { badge: { image_url: @badge.image_url, name: @badge.name } }
    assert_redirected_to badge_url(@badge)
  end

  test "should destroy badge" do
    assert_difference('Badge.count', -1) do
      delete admin_badge_url(@badge)
    end

    assert_redirected_to admin_badges_url
  end
end
