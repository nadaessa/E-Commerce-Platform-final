class CartsController < InheritedResources::Base
    def index
      @user =current_user.id
      @cartId=Cart.select(:id).where(user_id: @user).last.id
      @cartItems=CartItem.select(:quantity,:product_id).where(cart_id: @cartId)
      #-----------------------------
    # get subtotal price  
      @@cart_items=@cartItems
      @subtotal=self.subtotal 
      

      #@quantity = params[:qty].nil? ? 1 : params[:qty]
    end

    def subtotal 
      @sum=0
      @@cart_items.each do|cartItem|
          @sum =@sum + (cartItem.quantity* cartItem.product.price) 
      
      end
      return @sum
    end

    private
    def cart_params
      params.require(:cart).permit(:user_id, :id)
    end
    def cart_item_params
      params.require(:cart_item).permit(:quantity, :cart_id, :product_id)
    end



end
