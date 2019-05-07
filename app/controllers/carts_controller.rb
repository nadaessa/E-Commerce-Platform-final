class CartsController < InheritedResources::Base
  @@cartId=0
  @@coupone=nil
  @@order_id=nil

    def index
      $sum=0
      @user =current_user.id
      @@cartId=Cart.select(:id).where(user_id: @user).last.id
      @cartItems=CartItem.select(:quantity,:product_id).where(cart_id: @@cartId)
      @@order_id=Order.where(cart_id: @@cartId).last.id
      #-----------------------------
      # get subtotal price  
      @@cart_items=@cartItems
      @subtotal=self.subtotal
      #-----------------------------
      #check if there is coupone in sysytem
      @@coupone=Coupone.last
        if @@coupone.status=="available"
        @code=@@coupone.code
       else
        @code="there is no coupone in system now" 
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
        #billing address
      @first=params[:firstname]
      @last=params[:lastname]
      @email=params[:email]
      @address=params[:Address]
      @city=params[:city]
      @country=params[:country] 

        #billing address
       @firsts=params[:firstnames]
       @lasts=params[:lastnames]
       @emails=params[:emails]
       @addresss=params[:Addresss]
       @citys=params[:citys]
       @countrys=params[:countrys]

         #billing options
         @paymentMethod=params[:paymentMethod]
         @cartname=params[:cardname]
         @cartnumber=params[:cardnumber]


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
   
          #using coupone  discount in order        

          @coupone_code=Order.select(:coupone_code).where(id:  @@order_id)
          @coupone_type=Coupone.select(:coupone_type,:value).where(code: @coupone_code).last
          if @coupone_type.coupone_type=="fixed"
              @paid =$sum-@coupone_type.value
              flash[:alert] = "Total price is $#{$sum} but after using coupone with Discounted $#{@coupone_type.value} 
              You paid $#{@paid} "
          elsif  @coupone_type.coupone_type=="discount" 
            @paid=$sum-($sum*@coupone_type.value/100)
            flash[:alert] = "Total price is $#{$sum} but after using coupone with Discounted #{@coupone_type.value}%
            You paid $#{@paid} "
          else
            @paid=$sum 
            flash[:alert] = "Total price is $#{$sum}  "
          end
        end
         
         #set order data in database
         @addreses=params[:addressMethod]
         Order.where(:id =>@@order_id).limit(1).update_all(:order_status=>"Pending",:first_name => @first,:last_name => @last ,:Address =>@address,:email=>@email ,:city_id=>@city,:country_id =>@country,:paid_price=>@paid,:paymentMethod=>@paymentMethod ,:cardname=>@cartname,:cardnumber=>@cartnumber) 
         if  @addreses== "shipping"
          Order.where(:id =>@@order_id).limit(1).update_all(:order_status=>"Pending",:first_names => @firsts,:last_names => @lasts ,:Addresss =>@addresss,:emails=>@emails ,:citys_id=>@citys,:countrys_id =>@countrys,:paid_price=>@paid) 
         end
      
        
        #remove cart items and set it in order item table
        @items=CartItem.where(cart_id: @@cartId)
        
        @items.each do|item|
          @quantityOfitem=item.quantity
          @productOfitem=item.product_id
          @idOfitem=item.id
          OrderItem.create(status:"Pending",quantity:@quantityOfitem ,product_id:@productOfitem,order_id:@@order_id)
          CartItem.where(:id => @idOfitem).destroy_all
        end
           
        
      end 
        redirect_to "/carts"
    end
#-----------------------------------------------------------------------
    def take_coupone_code
      @coupone=params[:coupone_code]
      Order.create(order_status:"Pending",cart_id:@@cartId ,coupone_code:"#{@coupone}")
      @@order_id=Order.last.id
      
      #  redirect_to "/carts"
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
