class HomeController < ApplicationController
    #def index
     #   @products=Product.all
    #end


    def index
      #assign cart to user
      if user_signed_in? == true
        @user_id= current_user.id
        @rs=Cart.where(user_id:@user_id).empty?
        if @rs==true
           Cart.create(user_id:@user_id)
        end
      end 
      #check on coupones
      @coupone=Coupone.last
      Time.now.to_date
      
      if @coupone.expiration_type =="no_of_usage"
        @No_of_Usage=@coupone.no_of_usage
        @count=UserCoupone.where(coupone_id: @coupone.id).count
        if @count >= @No_of_Usage
          Coupone.where(id: @coupone.id).update_all(status: "unvailable")
        end  
        # render plain:@coupone.status
      elsif @coupone.expiration_type =="time"
        @coupone_Time=@coupone.time
        if Time.now.to_date >= @coupone_Time
          Coupone.where(id: @coupone.id).update_all(status: "unvailable")
        end  
      end
        
      @categories = Category.all
      @products = Product.search(params[:term], params[:search_term])
    end
     
    


    # def addItem
    #   @user = current_user.id
    #   @cartId = Cart.select(:id).where(user_id:@user).last.id
    #   @productId =params[:id]
    #   @product_quantity= Product.select(:quantity).where(id:@productId).last.quantity
    #   if @product_quantity > 0
    #   CartItem.create(quantity:1, cart_id:@cartId , product_id:@productId )
    #   flash[:success] = "added succesfully" 
    #   else

    #     flash[:alert] = "This product #{@productId}is not available" 
    #   end
    #   # @cartItem.save
    #   # render plain: @cartId.inspect
    #   redirect_to '/'
      
    # end
    
  
      def addItem
          @user = current_user.id
          @cartId = Cart.select(:id).where(user_id:@user).last.id
          @productId =params[:id]
         
          @product_quantity= Product.select(:quantity).where(id:@productId).last.quantity
          if @product_quantity > 0
              @item=CartItem.where(cart_id: @cartId ,product_id: @productId).empty?
              if @item ==false
               #exist in cart
               @detail_item=CartItem.select(:quantity).where(cart_id: @cartId ,product_id: @productId).last.quantity
               @quantity=@detail_item+1
               CartItem.where(cart_id: @cartId ,product_id: @productId).update_all(quantity: @quantity)
              else
               #not exit in cart
              CartItem.create(cart_id: @cartId ,product_id: @productId,quantity: 1)
              end    
              
           else
            flash[:alert] = "This product #{@productId}is not available" 
          end
      
           redirect_to '/'
      
    end


    private

    def product_params
      params.require(:product).permit(:title, :description, :price, :quantity, :image, :store_id, :category_id, :brand_id, :user_id, :term, :search_term)
    end

end
