class OrdersController < InheritedResources::Base

  private

    def order_params
      params.require(:order).permit(:cart_id, :order_status, :coupone_code, :Address, :paid_price, :first_name, :last_name, :email)
    end

end
