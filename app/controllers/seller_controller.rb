class SellerController < ApplicationController
  def index
    @user =current_user.id


    
   #@order_items = OrderItem.all
   @pending_items = OrderItem.where("state = 0")
   @confirmed_items = OrderItem.where("state = 1")

    #@order_items = OrderItem.joins("INNER JOIN products ON order_items.product_id = products.id AND products.user_id = current_user")
    # @users = User.all
   # @user_ids = User.select(:id).where(@users.id = current_user)
    render plain: @user
    #@order_items = OrderItem.where.any_of(state: '0')
    
  end

  def confirm
    @item1 = OrderItem.find(params[:id])
    @item1.state = 1
    @item1.save  
    redirect_to '/seller'
  end

  def deliver
    @item2 = OrderItem.find(params[:id])
    @item2.state = 2
    @item2.save  
    redirect_to '/seller'
  end
end
