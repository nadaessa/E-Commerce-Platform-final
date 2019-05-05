class SellerController < ApplicationController
  def index
    @user =current_user.id
    prooductIds = Product.select(:id).where(user_id: @user)
    #render plain: prooductIds.inspect
    @pending_items = OrderItem.where(state: 0 ,product_id: prooductIds)
    
    @confirmed_items = OrderItem.where(state: 1 ,product_id: prooductIds)
    
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
