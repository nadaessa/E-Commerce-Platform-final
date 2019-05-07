class OrdersController < InheritedResources::Base

  private

    def order_params
      params.require(:order).permit(:cart_id, :order_status, :coupone_code, :Address, :country, :references, :city, :references, :paid_price, :first_name, :last_name, :email, :paymentMethod, :cardname, :cardnumber, :first_names, :last_names, :emails, :addresss)
    end

end
