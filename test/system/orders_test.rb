require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Address", with: @order.Address
    fill_in "Addresss", with: @order.addresss
    fill_in "Cardname", with: @order.cardname
    fill_in "Cardnumber", with: @order.cardnumber
    fill_in "Cart", with: @order.cart_id
    fill_in "City", with: @order.city
    fill_in "Country", with: @order.country
    fill_in "Coupone code", with: @order.coupone_code
    fill_in "Email", with: @order.email
    fill_in "Emails", with: @order.emails
    fill_in "First name", with: @order.first_name
    fill_in "First names", with: @order.first_names
    fill_in "Last name", with: @order.last_name
    fill_in "Last names", with: @order.last_names
    fill_in "Order status", with: @order.order_status
    fill_in "Paid price", with: @order.paid_price
    fill_in "Paymentmethod", with: @order.paymentMethod
    fill_in "References", with: @order.references
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Address", with: @order.Address
    fill_in "Addresss", with: @order.addresss
    fill_in "Cardname", with: @order.cardname
    fill_in "Cardnumber", with: @order.cardnumber
    fill_in "Cart", with: @order.cart_id
    fill_in "City", with: @order.city
    fill_in "Country", with: @order.country
    fill_in "Coupone code", with: @order.coupone_code
    fill_in "Email", with: @order.email
    fill_in "Emails", with: @order.emails
    fill_in "First name", with: @order.first_name
    fill_in "First names", with: @order.first_names
    fill_in "Last name", with: @order.last_name
    fill_in "Last names", with: @order.last_names
    fill_in "Order status", with: @order.order_status
    fill_in "Paid price", with: @order.paid_price
    fill_in "Paymentmethod", with: @order.paymentMethod
    fill_in "References", with: @order.references
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
