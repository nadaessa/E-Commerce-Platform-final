class CartsController < InheritedResources::Base
  @@cartId=0
    def index
      @user =current_user.id
      @@cartId=Cart.select(:id).where(user_id: @user).last.id
      @cartItems=CartItem.select(:quantity,:product_id).where(cart_id: @@cartId)
      #-----------------------------
      # get subtotal price  
      @@cart_items=@cartItems
      @subtotal=self.subtotal
      
    end
     # increase and decrease quantity inncart page
    def update_quantity
      @id=params[:id]
      @quantity=params[:quantity]
      CartItem.where(:cart_id =>@@cartId ,:product_id => @id).limit(1).update_all(:quantity => @quantity) 
      redirect_to "/carts"
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
