class SellerController < ApplicationController
  def index
   # @products = User.where.any_of(name: 'Alice', gender: 'female')
   @order_items = OrderItem.all
  end
end
