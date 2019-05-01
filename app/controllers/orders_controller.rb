class OrdersController < InheritedResources::Base

  private

    def order_params
      params.require(:order).permit(:state, :cart_id)
    end

end
