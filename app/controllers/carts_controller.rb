class CartsController < InheritedResources::Base
  @@cartId=0
  @@coupone=nil
  @@order_id=nil

    def index
      $sum=0
      @user =current_user.id
      @@cartId=Cart.select(:id).where(user_id: @user).last.id
      @cartItems=CartItem.select(:quantity,:product_id).where(cart_id: @@cartId)

      #-----------------------------
      # get subtotal price  
      @@cart_items=@cartItems
      @subtotal=self.subtotal
      #-----------------------------
      #check if there is coupone in sysytem
      @@coupone=Coupone.last
     
      if @@coupone!=nil
        if @@coupone.status=="available"
        @code=@@coupone.code
       else
        @code="there is no coupone in system now" 
       end
      end
    end

     # increase and decrease quantity inncart page
    def update_quantity
      @id=params[:id]
      @quantity=params[:quantity]
      CartItem.where(:cart_id =>@@cartId ,:product_id => @id).limit(1).update_all(:quantity => @quantity) 
       redirect_to "/carts"
    end


    def subtotal 
      # $sum=0
      @@cart_items.each do|cartItem|
          $sum =$sum + (cartItem.quantity* cartItem.product.price) 
      end
      return $sum
    end
#--------------------------------------------------------------------------------
    def do_checkout

      #order_form data
      @first=params[:firstname]
      @last=params[:lastname]
      @email=params[:email]
      @address=params[:Address]
      #check quantity in product table
      cheak= Array.new
      @@cart_items.each do|cartItem|
        @cartitem_quantity=cartItem.quantity
        @cartitem_productId=cartItem.product_id
        @product_quantity=Product.select(:quantity).where(id:  @cartitem_productId).last.quantity
         
        #if quantity is insufficient
        if @product_quantity < @cartitem_quantity
          cheak.push("1");
          @productname=Product.select(:title).where(id: @cartitem_productId).last.title
           flash[:alert] = "The quantity of this product #{@productname} is insufficient"
        end
      end  
        #if quantity is sufficient
      unless cheak.include?("1")
        @check_1=1
        @@cart_items.each do|cartItem|
          @cartitem_quantity=cartItem.quantity
          @cartitem_productId=cartItem.product_id
          @product_quantity=Product.select(:quantity).where(id:  @cartitem_productId).last.quantity

          @product_quantity=@product_quantity-@cartitem_quantity
          Product.where(:id => @cartitem_productId).limit(1).update_all(:quantity => @product_quantity)
        end
          #using coupone  discount in order 
          @coupone=Coupone.last
          @record=UserCoupone.where(user_id: current_user.id ,coupone_id:  @coupone.id).empty?
          if @record == true
              if @coupone.status=="available"
                  if @coupone.coupone_type=="fixed"
                      @paid =$sum-@coupone.value
                      flash[:alert] = "Total price is $#{$sum} but after using coupone with Discounted $#{@coupone.value} 
                      You paid $#{@paid} "
                  elsif  @coupone.coupone_type=="discount" 
                    @paid=$sum-($sum*(@coupone.value)/100)
                    flash[:alert] = "Total price is $#{$sum} but after using coupone with Discounted #{@coupone.value}%
                    You paid $#{@paid} "
                  else
                    @paid=$sum 
                    flash[:alert] = "Total price is $#{$sum}  "
                  end  
              #set in coupone_user table
              @user =current_user.id
              UserCoupone.create(user_id: @user,coupone_id:@coupone.id)

            elsif @coupone.status=="unvailable"
              @paid=$sum 
              flash[:alert] = "Total price is $#{$sum}  "
             end
              
          elsif  @record == false
            flash[:alert] = "You Not Allawed to use our available coupone , because you use it before and [ Total price is $#{$sum} ]"
            @paid=$sum 
          end
  
        #set order data in database
        Order.create(cart_id: @@cartId,order_status:"Pending",coupone_code:@coupone.code,Address:@address,paid_price: @paid,first_name:@first,last_name:@last,email:@email)
        @order_id=Order.select(:id).last.id    
        #remove cart items and set it in order item table
        # @items=CartItem.where(cart_id: @@cartId)
        # @items.each do|item|
        #   @quantityOfitem=item.quantity
        #   @productOfitem=item.product_id
        #   @idOfitem=item.id
        #   OrderItem.create(quantity:@quantityOfitem ,product_id:@productOfitem,order_id:@order_id)
        #   CartItem.where(:id => @idOfitem).destroy_all
        #   flash[:alert] = "Success Order"
        # end
         
       end
    redirect_to "/carts"
  end

#------------------------------------------------------------------------
#delete from cart
    def cart_delete
      @product_id=params[:id]
      CartItem.where(:product_id => @product_id,cart_id: @@cartId).destroy_all
       redirect_to "/carts"
    end      


    private
    def cart_params
      params.require(:cart).permit(:user_id, :id)
    end
    def cart_item_params
      params.require(:cart_item).permit(:quantity, :cart_id, :product_id)
    end
    def order_params
      params.require(:order).permit(:order_status, :cart_id,:Address,:City,:Country,:coupone_code)
    end



end
