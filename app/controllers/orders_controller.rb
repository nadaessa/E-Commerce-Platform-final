class OrdersController < InheritedResources::Base
  
 def update_order

 end 

  private

    def order_params
      params.require(:order).permit(:state, :cart_id,:Address,:City,:Country,:coupone_code)
    end

end
