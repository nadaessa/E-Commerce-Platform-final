class CartItemsController < InheritedResources::Base

  private

    def cart_item_params
      params.require(:cart_item).permit(:quantity, :cart_id, :product_id)
    end

end
