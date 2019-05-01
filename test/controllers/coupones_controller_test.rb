require 'test_helper'

class CouponesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coupone = coupones(:one)
  end

  test "should get index" do
    get coupones_url
    assert_response :success
  end

  test "should get new" do
    get new_coupone_url
    assert_response :success
  end

  test "should create coupone" do
    assert_difference('Coupone.count') do
      post coupones_url, params: { coupone: { code: @coupone.code, expiration_type: @coupone.expiration_type, no_of_usage: @coupone.no_of_usage, status: @coupone.status, time: @coupone.time, type: @coupone.type, value: @coupone.value } }
    end

    assert_redirected_to coupone_url(Coupone.last)
  end

  test "should show coupone" do
    get coupone_url(@coupone)
    assert_response :success
  end

  test "should get edit" do
    get edit_coupone_url(@coupone)
    assert_response :success
  end

  test "should update coupone" do
    patch coupone_url(@coupone), params: { coupone: { code: @coupone.code, expiration_type: @coupone.expiration_type, no_of_usage: @coupone.no_of_usage, status: @coupone.status, time: @coupone.time, type: @coupone.type, value: @coupone.value } }
    assert_redirected_to coupone_url(@coupone)
  end

  test "should destroy coupone" do
    assert_difference('Coupone.count', -1) do
      delete coupone_url(@coupone)
    end

    assert_redirected_to coupones_url
  end
end
