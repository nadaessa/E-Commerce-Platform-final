class OrdersController < InheritedResources::Base

  private

    def order_params
      params.require(:order).permit(:cart_id, :state_id)
    end

end
