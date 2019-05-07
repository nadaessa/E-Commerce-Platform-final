require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { Address: @order.Address, addresss: @order.addresss, cardname: @order.cardname, cardnumber: @order.cardnumber, cart_id: @order.cart_id, city: @order.city, country: @order.country, coupone_code: @order.coupone_code, email: @order.email, emails: @order.emails, first_name: @order.first_name, first_names: @order.first_names, last_name: @order.last_name, last_names: @order.last_names, order_status: @order.order_status, paid_price: @order.paid_price, paymentMethod: @order.paymentMethod, references: @order.references } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { Address: @order.Address, addresss: @order.addresss, cardname: @order.cardname, cardnumber: @order.cardnumber, cart_id: @order.cart_id, city: @order.city, country: @order.country, coupone_code: @order.coupone_code, email: @order.email, emails: @order.emails, first_name: @order.first_name, first_names: @order.first_names, last_name: @order.last_name, last_names: @order.last_names, order_status: @order.order_status, paid_price: @order.paid_price, paymentMethod: @order.paymentMethod, references: @order.references } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
