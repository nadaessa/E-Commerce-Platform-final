class OrdersController < InheritedResources::Base
  
  private

    def order_params
      params.require(:order).permit(:status, :cart_id,:Address,:City,:Country,:coupone_code)
    end

end
