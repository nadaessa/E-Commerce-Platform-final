class OrdersController < InheritedResources::Base
  def index
    #get cart id for logged in user
    @user=current_user.id
    @@cartId=Cart.select(:id).where(user_id: @user).last.id
    #get orders for this cart_id
    @orders=Order.where(cart_id: @@cartId)
    #loop in each order to get items in each one
    @orders.each do|order|
      @check=1
      @order_item=OrderItem.select(:status).where(order_id: order.id)
      @first_item=@order_item.first
      @order_item.each do|item|
        if @first_item.status!=item.status
          @check=0
          break  
        end
      end
      if @check ==1
        @status=@first_item.status
        Order.where(id: order.id).update_all(order_status:@status)
        break
      end
    end
  end
  private

    def order_params
      params.require(:order).permit(:cart_id, :order_status, :coupone_code, :Address, :paid_price, :first_name, :last_name, :email)
    end

end
