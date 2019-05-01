class OrderItemsController < InheritedResources::Base

  private

    def order_item_params
      params.require(:order_item).permit(:quantity, :state, :cart_id, :product_id)
    end

end
