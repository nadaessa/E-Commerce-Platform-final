class CartsController < InheritedResources::Base

    def index
      # params.require(:cart).permit(:user_id)
      # params.require(:cart_item).permit(:quantity, :cart_id, :product_id)
      @user =current_user.id
      @cartId=Cart.select(:id).where(user_id: @user).last.id
      @cartItems=CartItem.select(:quantity,:product_id).where(cart_id: @cartId)
      
    end

    private
    def cart_params
      params.require(:cart).permit(:user_id, :id)
    end
    def cart_item_params
      params.require(:cart_item).permit(:quantity, :cart_id, :product_id)
    end



end
