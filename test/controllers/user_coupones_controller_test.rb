require 'test_helper'

class UserCouponesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_coupone = user_coupones(:one)
  end

  test "should get index" do
    get user_coupones_url
    assert_response :success
  end

  test "should get new" do
    get new_user_coupone_url
    assert_response :success
  end

  test "should create user_coupone" do
    assert_difference('UserCoupone.count') do
      post user_coupones_url, params: { user_coupone: { coupone_id: @user_coupone.coupone_id, user_id: @user_coupone.user_id } }
    end

    assert_redirected_to user_coupone_url(UserCoupone.last)
  end

  test "should show user_coupone" do
    get user_coupone_url(@user_coupone)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_coupone_url(@user_coupone)
    assert_response :success
  end

  test "should update user_coupone" do
    patch user_coupone_url(@user_coupone), params: { user_coupone: { coupone_id: @user_coupone.coupone_id, user_id: @user_coupone.user_id } }
    assert_redirected_to user_coupone_url(@user_coupone)
  end

  test "should destroy user_coupone" do
    assert_difference('UserCoupone.count', -1) do
      delete user_coupone_url(@user_coupone)
    end

    assert_redirected_to user_coupones_url
  end
end
