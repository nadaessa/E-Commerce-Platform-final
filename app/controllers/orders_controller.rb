class OrdersController < InheritedResources::Base
  
 def update_order
  @user =current_user.id
  @@cartId=Cart.select(:id).where(user_id: @user).last.id

  @name=params[:name]
  @address=params[:Address]
  @city=params[:city]
  @country=params[:country] 
  
  Order.where(:cart_id =>@@cartId ).limit(1).update_all(state: "Pending",:Name => @name ,:Address =>@address,:city_id=>@city,:country_id =>@country) 

 end 

  private

    def order_params
      params.require(:order).permit(:state, :cart_id,:Address,:City,:Country,:coupone_code)
    end

end
