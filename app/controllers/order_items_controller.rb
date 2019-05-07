class OrderItemsController < InheritedResources::Base
  def show
    @id=params[:id]
    @orderItems=OrderItem.where(order_id: @id)
    
  end

  private

    def order_item_params
      params.require(:order_item).permit(:order_id, :product_id, :quantity)
    end

end
